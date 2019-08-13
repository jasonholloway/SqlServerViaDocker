using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using NUnit.Framework;
using SqlServerViaDocker;
using static Common.Markers;

namespace Demo2
{
    public class Demo
    {
        [Test]
        public async Task Normal() 
        {
            Marker("Starting");
            
            using (var sqlServer = new SqlServerViaDockerSlow("sqlservr-tracking")) 
            {
                await sqlServer.Start();
                Marker("Started");

                using (var db = new SqlConnection($"Server={sqlServer.Host},{sqlServer.Port};Database=electio_tracking;User Id=sa;Password=Wibble123!")) 
                {
                    await db.OpenAsync();
                    Marker("Opened");

                    var consignmentId = await db.CreateConsignment();
                    var carrierConsignmentId = await db.CreateCarrierConsignment(consignmentId);
                    var carrierPackageId = await db.CreateCarrierPackage(carrierConsignmentId, packageRefPerLegMpd: 12345);

                    var packages = await db.QueryAsync("SELECT * FROM dbo.CarrierPackages");

                    Assert.That(packages.Count(), Is.EqualTo(1));
                }

                Marker("Finished");
            }
        }
        
        [Test]
        public async Task ViaCRIU() 
        {
            Marker("Starting");
            
            using (var sqlServer = new SqlServerViaDockerFast("sqlservr-tracking")) 
            {
                await sqlServer.Start();
                Marker("Started");
                
                using (var db = new SqlConnection($"Server={sqlServer.Host},{sqlServer.Port};Database=electio_tracking;User Id=sa;Password=Wibble123!")) 
                {
                    await db.OpenAsync();
                    Marker("Opened");

                    var consignmentId = await db.CreateConsignment();
                    var carrierConsignmentId = await db.CreateCarrierConsignment(consignmentId);
                    var carrierPackageId = await db.CreateCarrierPackage(carrierConsignmentId, packageRefPerLegMpd: 12345);

                    var packages = await db.QueryAsync("SELECT * FROM dbo.CarrierPackages");

                    Assert.That(packages.Count(), Is.EqualTo(1));
                }
                
                Marker("Finished");
            }
        }
    }
}