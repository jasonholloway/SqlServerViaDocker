using System;
using System.IO.Pipes;

namespace SqlServerViaDocker
{
    public static class DockerDeducer
    {
        public static DockerDeduction Deduce()
            => TryDockerHostEnvVar("SQLSERVER_DOCKER_HOST")
               ?? TryDockerHostEnvVar("DOCKER_HOST")
               ?? TryUnixSocket("/var/run/docker.sock")
               ?? TryWindowsPipe("docker_engine")
               ?? ThrowNothingFound();

        private static DockerDeduction TryDockerHostEnvVar(string envVarName)
        {
            var dockerHostVar = Environment.GetEnvironmentVariable(envVarName);
            if (dockerHostVar == null) return null;
            
            var apiUri = new Uri(dockerHostVar);
            return new DockerDeduction(
                dockerApi: apiUri,
                hostUri: apiUri,
                hostPorts: "44000-45000");
        }
        
        private static DockerDeduction TryUnixSocket(string pipePath)
        {
            switch (Environment.OSVersion.Platform)
            {
                case PlatformID.Unix:
                case PlatformID.MacOSX:
                    return new DockerDeduction(
                        dockerApi: new Uri($"unix://{pipePath}"), 
                        hostUri: new Uri("tcp://127.0.0.1"),
                        hostPorts: "44000-45000");
                    
                default:
                    return null;
            }
        }

        private static DockerDeduction TryWindowsPipe(string pipeName)
        {
            if (Environment.OSVersion.Platform != PlatformID.Win32NT) return null;
            try
            {
                using (var str = new NamedPipeClientStream(pipeName))
                {
                    str.Connect(100);
                }
                return new DockerDeduction(
                    dockerApi: new Uri($"npipe://./pipe/{pipeName}"), 
                    hostUri: new Uri("tcp://127.0.0.1"),
                    hostPorts: "44000-45000");
            }
            catch (TimeoutException)
            {
                return null;
            }
        }

        private static DockerDeduction ThrowNothingFound()
        {
            throw new ApplicationException("Can't find available Docker API");
        }
    }

    public class DockerDeduction
    {
        public Uri DockerApi { get; }
        public Uri HostUri { get; }
        public string HostPorts { get; }
        
        public DockerDeduction(Uri dockerApi, Uri hostUri, string hostPorts)
        {
            DockerApi = dockerApi;
            HostUri = hostUri;
            HostPorts = hostPorts;
        }
    }
}