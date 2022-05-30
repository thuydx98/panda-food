import { Component, OnInit } from '@angular/core';
import Chart from 'chart.js';
import { MomentHelper } from 'app/commons/helpers/moment.helper';
import { ReportService } from 'app/services/statistics/report.service';
import { RevenueOverviewViewModel, RevenueByStoreViewModel, RevenueByStoreListOrdersViewModel } from 'app/models/report';
import { DateFormat } from 'app/commons/consts/date-format.const';
import { ActivatedRoute } from '@angular/router';
import { WarehouseService } from 'app/services/warehouse/warehouse.service';
import { ImportExportHistoryViewModel, PartnerViewModel, PartnerMaterialViewModel } from 'app/models/warehouse';
import * as moment from 'moment';
import { PagedListModel } from 'app/models/app';
import { PartnerService } from 'app/services/warehouse/partner.service';
import get from 'lodash/get';
import { ColorTable } from 'app/commons/consts/color.const';
@Component({
  selector: 'app-store-overview',
  templateUrl: './store-overview.component.html',
})
export class StoreOverviewComponent implements OnInit {

  public loading = false;
  public today = new Date();
  public startTime: string;
  public endTime: string;
  public revenueData: RevenueByStoreViewModel;

  public canvas: any;
  public ctx;
  public chartHours;
  public chartDays;
  public storeId: number;
  public storeDetail: RevenueByStoreListOrdersViewModel;
  public exportMaterial: ImportExportHistoryViewModel[];
  public timeExport: string;
  public page = 1;
  public pageSize = 10;
  public listPartner: PagedListModel<PartnerViewModel>;
  public searchString = '';
  public listMaterial: PartnerMaterialViewModel[] = [];
  public material: PartnerMaterialViewModel;
  public materialOfByDay: PartnerMaterialViewModel;
  public priceImportMaterialTotal = 0;
  public countTime: string[];
  public chartStores;
  public typeRevenue = ['income', 'outcome'];
  public timeOfExport: string;
  public ColorTable = ColorTable;
  public timeImport: string;
  public timeImportByDay: string[];
  public indexOfTimeEqual: number;
  public exportHistory: ImportExportHistoryViewModel[];
  constructor(
    private reportService: ReportService,
    private route: ActivatedRoute,
    private warehouseService: WarehouseService,
    private partnerService: PartnerService,
    ) {
    this.route.paramMap.subscribe(params => {
      this.storeId = Number(params.get('id'));
    })
   }

  ngOnInit() {
    this.startTime = MomentHelper.addDay(this.startTime, -8).format(DateFormat.DateFormatJson);
    this.endTime = MomentHelper.addDay(this.endTime, -1).format(DateFormat.DateFormatJson);
    this.getData();
  }

  public parseDateToString(date: string): string {
    return MomentHelper.formatDate(date, DateFormat.DateOnlyFormatJson);
  }

  public formatCurrency(numberInput: number): string {
    if (!numberInput && numberInput !== 0) {
      return 'N/A';
    }

    return numberInput.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1.') + ' ₫';
  }

  public getData(): void {
    this.exportMaterial = [];
    this.loading = true;
    const startTime = MomentHelper.formatDate(this.startTime, DateFormat.DateFormatMMDDYYYY);
    const endTime = MomentHelper.formatDate(this.endTime, DateFormat.DateFormatMMDDYYYY);
    this.reportService.getRevenueStore(startTime, endTime).subscribe(
      (res) => {
        if (res) {
          this.revenueData = res;
          this.storeDetail = this.revenueData.details.find(e => e.storeId === this.storeId);
          this.warehouseService.getExportHistories(this.storeId).subscribe(exportHistory => {
            if (exportHistory) {
              this.exportHistory = exportHistory;
              exportHistory.forEach(element => {
                this.timeExport = MomentHelper.formatDate(element.time, DateFormat.DateFormatMMDDYYYY)
                if ((moment(this.timeExport).isBetween(this.startTime, this.endTime, null, '(]'))) {
                  this.exportMaterial.push(element)
                }
              });
              this.partnerService.getListPartner(
                this.page,
                this.pageSize,
                this.searchString
              ).subscribe(listPartner => {
                if (listPartner) {
                  this.listPartner = listPartner;
                  this.listMaterial = [];
                  listPartner.items.map(e => {
                    this.listMaterial = [...this.listMaterial, ...e.materials];
                  });
                  this.loading = false;
                  this.priceImportMaterialTotal = 0;
                  this.countTime = [];
                  this.timeImportByDay = [];
                  this.exportMaterial.forEach(element => {
                    this.timeImport = MomentHelper.formatDate(element.time, DateFormat.DM)
                    this.timeOfExport = MomentHelper.formatDate(element.time, DateFormat.DateFormatMMDDYYYY)
                    if (this.countTime.indexOf(this.timeOfExport) === -1) {
                      this.countTime.push(this.timeOfExport);
                    }
                    this.timeImportByDay.push(this.timeImport);
                    this.material = this.listMaterial.find(material => material.materialId === element.materialId)
                    this.priceImportMaterialTotal += this.material.price * element.quantity;
                  });
                  this.initChartData();
                  this.loading = false;
                }
              });
            }
          });
        }
      }
    );
  }

  private initChartData(): void {
    const dataset = [];

    this.revenueData.storeRevenues.forEach((item, index) => {
      if (item.storeId === this.storeId) {
        dataset.push({
          data: item.revenueByDay,
          label: 'input',
          fill: false,
          borderColor: ColorTable[0],
          pointBorderColor: ColorTable[0],
          pointRadius: 3,
          pointHoverRadius: 3,
          pointBorderWidth: 4,
        });
      }
    });
    const dateImportMaterial = [];
    const labels = [];
    let tempDate = new Date(this.revenueData.startDate);
    while (tempDate <= new Date(this.revenueData.endDate)) {
      labels.push(tempDate.getDate() + '/' + (tempDate.getMonth() + 1));
      dateImportMaterial.push(tempDate.getDate() + '/' + (tempDate.getMonth() + 1));
      tempDate = new Date(tempDate.getTime() + (60 * 60 * 24 * 1000));
    }
    const listPriceImportByDay = [];
    let priceImportByDay = 0;
    let timeOfApi: string;
    for (let z = 0; z < dateImportMaterial.length; z++) {
      listPriceImportByDay.push(0);
    }
    for (let i = 0; i < this.exportMaterial.length; i++ ) {
      timeOfApi = MomentHelper.formatDate(this.exportMaterial[i].time, DateFormat.DM)
      this.materialOfByDay = this.listMaterial.find(material => material.materialId === this.exportMaterial[i].materialId)
      if (timeOfApi === this.timeImportByDay[i]) {
        priceImportByDay += this.exportMaterial[i].quantity * this.materialOfByDay.price
      }
      this.indexOfTimeEqual = dateImportMaterial.indexOf(timeOfApi)
      if (timeOfApi !== this.timeImportByDay[i + 1]) {
        listPriceImportByDay[this.indexOfTimeEqual] = priceImportByDay;
        priceImportByDay = 0;
      }
    }
    dataset.push({
      data: listPriceImportByDay,
      label: 'output',
      borderColor: ColorTable[1],
      pointBorderColor: ColorTable[1],
      fill: false,
      pointRadius: 3,
      pointHoverRadius: 3,
      pointBorderWidth: 4,
    })

    this.canvas = document.getElementById('chartStores');
    this.ctx = this.canvas.getContext('2d');
    this.chartStores = new Chart(this.ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: dataset,
      },
      options: {
        legend: {
          display: false,
          position: 'top'
        }
      }
    });
  }

}
