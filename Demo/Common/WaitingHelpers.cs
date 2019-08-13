using System;
using System.Threading;
using System.Threading.Tasks;

namespace Common
{
    public static class WaitingHelpers
    {
        public const int DefaultTimeout = 10000;
        public const int DefaultPollPeriod = 10;
        
        public static async Task<T> WaitForTask<T>(Func<CancellationToken, Task<T>> createTask, int timeout = DefaultTimeout, CancellationToken cancel = default(CancellationToken),
            string timeoutMessage = null)
        {
            var cancelSource = CancellationTokenSource.CreateLinkedTokenSource(cancel);

            var task = createTask(cancelSource.Token);
            
            var timer = Task.Run(async () =>
            {
                await DebugFriendlyDelay(timeout, cancel);

                if (!task.IsCompleted)
                {
                    cancelSource.CancelAfter(DefaultPollPeriod);
                    throw new TimeoutException(timeoutMessage ?? "Timed out!");
                }
            });

            await Task.WhenAny(task, timer).Unwrap();
            
            cancelSource.Cancel();

            return task.Result;
        }

        public static Task WaitForTask(Func<CancellationToken, Task> createTask, int timeout = DefaultTimeout,
            CancellationToken cancel = default(CancellationToken), string timeoutMessage = null)
            => WaitForTask(async ct =>
            {
                await createTask(ct);
                return true;
            }, timeout, cancel, timeoutMessage);

        public static async Task DebugFriendlyDelay(int delay, CancellationToken cancel = default(CancellationToken))
        {
            while (delay > 0)
            {
                await Task.Delay(DefaultPollPeriod, cancel);
                delay -= DefaultPollPeriod;
            }
        }
    }
    
    public static class WaitingExtensions
    {
        public static Task Timeout(this Task task, int timeout = WaitingHelpers.DefaultTimeout, CancellationToken cancel = default(CancellationToken), string timeoutMessage = null)
            => WaitingHelpers.WaitForTask(_ => task, timeout, cancel, timeoutMessage);
    }
}