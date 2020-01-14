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
            
            using (var sqlServer = new SqlServerViaDockerSlow("sqlservr-camels")) 
            {
                await sqlServer.Start();
                Marker("Started");

                using (var db = new SqlConnection($"Server={sqlServer.Host},{sqlServer.Port};Database=CamelsRUs;User Id=sa;Password=Wibble123!")) 
                {
                    await db.OpenAsync();
                    Marker("Opened");
                    
                    var ranchId = await db.CreateRanch(name: "Jason's Camel Ranch");
                    
                    var camelId1 = await db.CreateCamel(name: "Claude", species: "Dromedary", age: 7);
                    await db.PlaceCamel(ranchId, camelId1);
                    
                    var camelId2 = await db.CreateCamel(name: "Claudette", species: "Persian", age: 14);
                    await db.PlaceCamel(ranchId, camelId2);

                    
                    var camels = await db.QueryAsync("SELECT * FROM Camels WHERE Species IN ('Bactrian', 'Wild Bactrian', 'Dromedary')");
                    Assert.That(camels.Count(), Is.EqualTo(1));
                }

                Marker("Finished");
            }
        }
        
        [Test]
        public async Task ViaCRIU() 
        {
            Marker("Starting");
            
            using (var sqlServer = new SqlServerViaDockerFast("sqlservr-camels")) 
            {
                await sqlServer.Start();
                Marker("Started");
                
                using (var db = new SqlConnection($"Server={sqlServer.Host},{sqlServer.Port};Database=CamelsRUs;User Id=sa;Password=Wibble123!")) 
                {
                    await db.OpenAsync();
                    Marker("Opened");

                    var ranchId = await db.CreateRanch(name: "Jason's Camel Ranch");
                    
                    var camelId1 = await db.CreateCamel(name: "Claude", species: "Dromedary", age: 7);
                    await db.PlaceCamel(ranchId, camelId1);
                    
                    var camelId2 = await db.CreateCamel(name: "Claudette", species: "Persian", age: 14);
                    await db.PlaceCamel(ranchId, camelId2);

                    
                    var camels = await db.QueryAsync("SELECT * FROM Camels WHERE Species IN ('Bactrian', 'Wild Bactrian', 'Dromedary')");
                    Assert.That(camels.Count(), Is.EqualTo(1));
                }
                
                Marker("Finished");
            }
        }
    }
}