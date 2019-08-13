using System.Data.SqlClient;
using System.Threading;
using System.Threading.Tasks;
using NUnit.Framework;

namespace SqlServerViaDocker.Tests
{
    [TestFixture]
    public class FastTests
    {
        [Test]
        public async Task Available_AfterStart()
        {
            using (var sql = new SqlServerViaDockerFast("sqlservr-tracking"))
            {
                await sql.Start(CancellationToken.None);
                
                var connectionString =
                    $"Server={sql.ServerUri.Host},{sql.ServerUri.Port};Database=electio_tracking;User Id=sa;Password=Wibble123!;Encrypt=False;Connection Timeout=30;MultipleActiveResultSets=True";
            
                using (var connection = new SqlConnection(connectionString))
                {
                    await connection.OpenAsync();
                }
            }
        }
    }
}