using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Docker.DotNet;
using Docker.DotNet.Models;

namespace SqlServerViaDocker
{
    public class SqlServerViaDockerFast : IDisposable
    {
        private static Lazy<DockerDeduction> _lzDeduced;
        private static Lazy<DockerClient> _lzDocker;
        
        private string _contId;
        private readonly string _dockerImage;

        public Uri ServerUri { get; private set; }
        public string Host => ServerUri.Host;
        public int Port => ServerUri.Port;
        
        static SqlServerViaDockerFast()
        {
            _lzDeduced = new Lazy<DockerDeduction>(DockerDeducer.Deduce);
            _lzDocker = new Lazy<DockerClient>(
                () => new DockerClientConfiguration(_lzDeduced.Value.DockerApi)
                        .CreateClient());
        }

        public SqlServerViaDockerFast(string dockerImage)
        {
            _dockerImage = dockerImage;
        }

        public async Task Start(CancellationToken cancel = default(CancellationToken))
        {
            var docker = _lzDocker.Value;
            var deduced = _lzDeduced.Value;
            
            _contId = await RunContainer();
            ServerUri = await GetContainerUri();

            await Task.Delay(1500, cancel); //miserably needed till we can poll for readiness
            
            async Task<string> RunContainer()
            {
                var contParams = new CreateContainerParameters
                {
                    Image = _dockerImage,
                    HostConfig = new HostConfig
                    {
                        AutoRemove = true,
                        Privileged = true,
                        Tmpfs = new Dictionary<string, string>
                            { ["/run"] = "rw" },
                        PortBindings = new Dictionary<string, IList<PortBinding>>
                            { ["1433/tcp"] = new[] { new PortBinding { HostPort = deduced.HostPorts } } }
                    },
                    ExposedPorts =new Dictionary<string, EmptyStruct>
                        { ["1433/tcp"] = default(EmptyStruct) },
                    Env = new[] { "STOP_AFTER=1m", "RUN_FAST=1" },
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

                var uri = new UriBuilder(deduced.HostUri);
                uri.Port = int.Parse(net.Ports["1433/tcp"].First().HostPort);
                return uri.Uri;
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