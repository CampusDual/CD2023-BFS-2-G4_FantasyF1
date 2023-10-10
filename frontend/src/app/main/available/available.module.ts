import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AvailableRoutingModule } from './available-routing.module';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { AvailableHomeComponent } from './available-home/available-home.component';
import { CompetitionsDetailComponent } from '../competitions/competitions-detail/competitions-detail.component';


@NgModule({
  declarations: [AvailableHomeComponent],
  imports: [
    CommonModule,
    AvailableRoutingModule,
    OntimizeWebModule
  ]
})
export class AvailableModule { }
