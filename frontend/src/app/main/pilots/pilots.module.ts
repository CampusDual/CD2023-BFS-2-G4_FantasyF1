import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { PilotsRoutingModule } from './pilots-routing.module';
import { PilotsHomeComponent } from './pilots-home/pilots-home.component';


@NgModule({
  declarations: [PilotsHomeComponent],
  imports: [
    CommonModule,
    OntimizeWebModule,
    PilotsRoutingModule
  ]
})
export class PilotsModule { }
