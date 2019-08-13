using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using Docker.DotNet;
using Docker.DotNet.Models;

namespace SqlServerViaDocker
{
    public class SqlServerViaDockerSlow : IDisposable
    {
        private static Lazy<DockerDeduction> _lzDeduced;
        private static Lazy<DockerClient> _lzDocker;
        
        static SqlServerViaDockerSlow()
        {
            _lzDeduced = new Lazy<DockerDeduction>(DockerDeducer.Deduce);
            _lzDocker = new Lazy<DockerClient>(
                () => new DockerClientConfiguration(_lzDeduced.Value.DockerApi)
                        .CreateClient());
        }
        
        private readonly string _imageName;
        private string _contId;

        public Uri ServerUri { get; private set; }
        public string Host => ServerUri.Host;
        public int Port => ServerUri.Port;

        public SqlServerViaDockerSlow(string imageName)
        {
            _imageName = imageName;
        }
        
        public async Task Start(CancellationToken cancel = default)
        {
            var docker = _lzDocker.Value;
            var deduced = _lzDeduced.Value;

            _contId = await RunContainer();
            
            var readingTillReady = ReadLogsTillMatch(
               pattern: "ready for client connections", 
               timeout: TimeSpan.FromSeconds(20));

            ServerUri = await GetContainerUri();

            await readingTillReady;
            
            async Task<string> RunContainer()
            {
                var contParams = new CreateContainerParameters
                {
                    Image = _imageName,
                    HostConfig = new HostConfig
                    {
                        AutoRemove = true,
                        PortBindings = new Dictionary<string, IList<PortBinding>>
                            { ["1433/tcp"] = new[] { new PortBinding { HostPort = deduced.HostPorts} } }
                    },
                    ExposedPorts =new Dictionary<string, EmptyStruct>
                        { ["1433/tcp"] = default },
                    Env = new[] { "STOP_AFTER=1m" },
                };
                
                var cont = await docker.Containers
                    .CreateContainerAsync(contParams, cancel);
                
                await docker.Containers
                    .StartContainerAsync(cont.ID, new ContainerStartParameters(), cancel);
                
                return cont.ID;
            }
            
            async Task<Uri> GetContainerUri()
            {
                var info = await docker.Containers.InspectContainerAsync(_contId, cancel);
                var net = info.NetworkSettings;

                var builder = new UriBuilder(_lzDeduced.Value.HostUri)
                {
                    Port = int.Parse(net.Ports["1433/tcp"].First().HostPort)
                };
                return builder.Uri;
            }

            async Task ReadLogsTillMatch(string pattern, TimeSpan timeout)
            {
                var matcher = new Regex(pattern);

                var logs = await docker.Containers.GetContainerLogsAsync(_contId,
                    new ContainerLogsParameters {ShowStderr = false, ShowStdout = true, Follow = true, Since = "10000"},
                    cancel);

                using (var reader = new StreamReader(logs))
                {
                    var sw = Stopwatch.StartNew();
                    while (sw.Elapsed < timeout)
                    {
                        var line = await reader.ReadLineAsync();
                        if (line != null && matcher.IsMatch(line)) return;
                    }
                    
                    throw new TimeoutException();
                }
            }
        }

        public void Dispose()
        {
            if (_contId != null && _lzDocker.IsValueCreated)
            {
                var docker = _lzDocker.Value;
                docker.Containers
                    .KillContainerAsync(_contId, new ContainerKillParameters());
            }
        }
    }
}