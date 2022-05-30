using System;
using System.Collections.Generic;
using System.Text;
using WarehouseApi.Business.Warehouse.ViewModels;
using System.Threading.Tasks;

namespace WarehouseApi.Business.Warehouse.Queries.GetExportHistories
{
    public interface IGetExportHistoriesQuery
    {
        Task<List<ImportExportHistoryViewModel>> ExecuteAsync(int? storeId);
    }
}
