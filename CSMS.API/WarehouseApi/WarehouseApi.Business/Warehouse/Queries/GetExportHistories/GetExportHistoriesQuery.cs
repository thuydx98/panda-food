using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WarehouseApi.Business.Warehouse.ViewModels;
using WarehouseApi.Data.Entities;
using WarehouseApi.Data.Services;

namespace WarehouseApi.Business.Warehouse.Queries.GetExportHistories
{
    public class GetExportHistoriesQuery : IGetExportHistoriesQuery
    {
        private readonly IRepository<CsmsExportHistory> _exportRepository;

        public GetExportHistoriesQuery(
            IRepository<CsmsExportHistory> exportRepository)
        {
            _exportRepository = exportRepository;
        }

        public async Task<List<ImportExportHistoryViewModel>> ExecuteAsync(int? storeId)
        {
            var exportHistories = await _exportRepository.TableNoTracking
                .Where(n => storeId.HasValue ? n.BranchId == storeId.Value : true)
                .Select(n => new ImportExportHistoryViewModel()
                {
                    MaterialId = n.MaterialId,
                    MaterialName = n.Material.Name,
                    Unit = n.Material.Unit,
                    Quantity = n.QuantityUnit,
                    Time = n.ExportDate,
                    BranchId = n.BranchId,
                    BranchName = n.BranchName
                })
                .ToListAsync();

            return exportHistories.OrderByDescending(n => n.Time).ToList();
        }
    }
}
