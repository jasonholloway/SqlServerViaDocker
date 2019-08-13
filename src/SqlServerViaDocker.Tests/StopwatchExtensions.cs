using System;
using System.Diagnostics;

namespace SqlServerViaDocker.Tests
{
    public static class StopwatchExtensions
    {
        public static void LogRestart(this Stopwatch sw, string tag)
        {
            Console.WriteLine($"{tag} {sw.ElapsedMilliseconds}ms");
            sw.Restart();
        }
        
    }
}