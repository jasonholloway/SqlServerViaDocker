using System.Data;
using System.Threading.Tasks;
using Dapper;

namespace Demo2
{
    public static class DatabasePopulatingExtensions
    {
        public static Task<int> CreateRanch(this IDbConnection conn, string name)
            => conn.QuerySingleAsync<int>($@"
                INSERT INTO Ranches
                VALUES (
                    @name
                );
                SELECT @@IDENTITY", 
                new { name });
        
        public static Task<int> CreateCamel(this IDbConnection conn, string name, string species, int age)
            => conn.QuerySingleAsync<int>($@"
                INSERT INTO Camels
                VALUES (
                    @name,
                    @species,
                    @age
                );
                SELECT @@IDENTITY",
                new { name, species, age });

        public static Task<int> PlaceCamel(this IDbConnection conn, int ranchId, int camelId)
            => conn.QuerySingleAsync<int>($@"
                INSERT INTO Placements 
                VALUES (
                    @camelId,
                    @ranchId
                );
                SELECT @@IDENTITY",
                new { ranchId, camelId });
    }
}