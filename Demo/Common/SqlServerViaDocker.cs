using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Docker.DotNet;
using Docker.DotNet.Models;

namespace Common
{
    public class SqlServerViaDocker : IDisposable
    {
        private readonly DockerClient _docker;
        private readonly string _imageName;
        private string _contId;

        public SqlServerViaDocker(string imageName) 
        {
            _imageName = imageName;
            _docker = new DockerClientConfiguration(new Uri("tcp://localhost:2375"))
                .CreateClient();
        }

        public async Task Start() 
        {
            _contId = await RunContainer();
            
            await ReadLogsTillMatch(_contId, "ready for client connections")
                .Timeout(20000);
        }

        private async Task<string> RunContainer()
        {
            var contParams = new CreateContainerParameters
            {
                Image = _imageName, 
                HostConfig = new HostConfig
                {
                    AutoRemove = true,
                    PortBindings = new Dictionary<string, IList<PortBinding>>
                        { ["1433/tcp"] = new[] { new PortBinding { HostPort = "1433" } } }
                },
                ExposedPorts =new Dictionary<string, EmptyStruct>
                    { ["1433/tcp"] = default(EmptyStruct) }
            };
            
            var cont = await _docker.Containers
                .CreateContainerAsync(contParams);
            
            await _docker.Containers
                .StartContainerAsync(cont.ID, new ContainerStartParameters());
            
            return cont.ID;
        }

        private async Task ReadLogsTillMatch(string contId, string pattern)
        {
            var logs = await _docker.Containers.GetContainerLogsAsync(contId,
                new ContainerLogsParameters 
                {
                    ShowStderr = false, 
                    ShowStdout = true, 
                    Follow = true, 
                    Since = "100000"
                });

            var matcher = new Regex(pattern);
            using (var reader = new StreamReader(logs))
            {
                while (true)
                {
                    var line = await reader.ReadLineAsync();
                    if (matcher.IsMatch(line)) break;
                }
            }
        }

        public void Dispose()
        {
            if (_contId != null)
            {
                _docker.Containers
                    .RemoveContainerAsync(_contId, new ContainerRemoveParameters { Force = true });
            }
        }
    }
}