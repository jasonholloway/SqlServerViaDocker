using System;
using System.IO;
using System.Threading.Tasks;

namespace Common
{
    public static class Markers
    {
        private static TextWriter _file = File.AppendText($"markers{DateTimeOffset.Now.ToUnixTimeMilliseconds()}.log");

        public static void Marker(string line)
        {
            var now = DateTimeOffset.Now.ToUnixTimeMilliseconds();
            _file.WriteLine($"{(double)now/1000:F3} {line}");
            _file.Flush();
        }
    }
}