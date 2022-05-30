import { Component } from '@angular/core';
import { MenuTab } from '../../../commons/menu-tabs/menu-tabs.component';

export const IdTabs = {
  StoreInformation: 1,
  StoreProducts: 2,
  StoreWarehouse: 3,
  StoreEmployee: 4,
  StoreOverview: 5
}

@Component({
  selector: 'app-store-detail',
  templateUrl: './store-detail.component.html'
})
export class StoreDetailComponent {
  public selectedTab: number;
  public idTabs = IdTabs;
  public listTab: MenuTab[] = [
    new MenuTab(IdTabs.StoreOverview, `Store's Overview`, 'nc-chart-bar-32'),
    new MenuTab(IdTabs.StoreInformation, 'Store Information', 'nc-shop'),
    new MenuTab(IdTabs.StoreWarehouse, `Store's Warehouse`, 'nc-basket'),
    new MenuTab(IdTabs.StoreEmployee, `Store's Employees`, 'nc-basket'),
    new MenuTab(IdTabs.StoreProducts, `Store's Products`, 'nc-basket'),
  ];
}
