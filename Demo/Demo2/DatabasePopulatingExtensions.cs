using System;
using System.Data;
using System.Threading.Tasks;
using Dapper;

namespace Demo2
{
    public static class DatabasePopulatingExtensions
    {
        public static Task<int> CreateConsignment(this IDbConnection conn)
            => conn.ExecuteAsync($@"
                INSERT INTO dbo.Consignments
                VALUES (
                    'consRefForAllLegsMpd1',
                    DEFAULT,
                    CONVERT(uniqueidentifier, '{Guid.NewGuid()}')
                );
                SELECT SCOPE_IDENTITY()");

        public static Task<int> CreateCarrierConsignment(this IDbConnection conn, int consignmentId)
            => conn.ExecuteAsync($@"
                INSERT INTO dbo.CarrierConsignments 
                VALUES (
                    'carrRef', 
                    'carrServiceRef', 
                    'consRefForLegCarrier', 
                    1234, 
                    'consTrackingRef', 
                    1,
                    1, 
                    {consignmentId}, 
                    '2019-08-08', 
                    'consRefForAllLegsMpd', 
                    'carrierServiceName', 
                    NULL,
                    'GB',
                    DEFAULT,
                    NULL,
                    '2020-01-01',
                    NULL,
                    NULL
                );
                SELECT SCOPE_IDENTITY()");
        
        public static Task<int> CreateCarrierPackage(this IDbConnection conn, int carrierConsignmentId, int packageRefPerLegMpd)
            => conn.ExecuteAsync($@"
                INSERT INTO dbo.CarrierPackages
                VALUES (
                    'packageRefByCarrier', 
                    {packageRefPerLegMpd}, 
                    'packageTrackingRef', 
                    {carrierConsignmentId}, 
                    'EC-000', 
                    DEFAULT
                );
                SELECT SCOPE_IDENTITY()");
    }
}