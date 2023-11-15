import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { PilotsRoutingModule } from './pilots-routing.module';
import { PilotsHomeComponent } from './pilots-home/pilots-home.component';
import { OChartModule } from 'ontimize-web-ngx-charts';
import { PilotsPointsChartComponent } from './pilots-points-chart/pilots-points-chart.component';
import { PilotsPriceChartComponent } from './pilots-price-chart/pilots-price-chart.component';


@NgModule({
  declarations: [PilotsHomeComponent, PilotsPointsChartComponent, PilotsPriceChartComponent],
  imports: [
    CommonModule,
    OntimizeWebModule,
    PilotsRoutingModule,
    OChartModule
  ]
})
export class PilotsModule { }
