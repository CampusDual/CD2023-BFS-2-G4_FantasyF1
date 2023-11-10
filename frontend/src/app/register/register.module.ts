import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { RegisterRoutingModule } from './register-routing.module';
import { RegisterHomeComponent } from './register-home/register-home.component';
import { SharedModule } from '../shared/shared.module';
import { OntimizeWebModule } from 'ontimize-web-ngx';


@NgModule({
  declarations: [RegisterHomeComponent],
  imports: [
    SharedModule,
    OntimizeWebModule,
    CommonModule,
    RegisterRoutingModule,
  ],
  exports: [
    RegisterHomeComponent
  ]
})
export class RegisterModule { }
