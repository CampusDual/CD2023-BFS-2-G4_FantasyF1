import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';

import { SharedModule } from '../../shared/shared.module';
import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';
import { CompetitionsModule } from '../competitions/competitions.module';

@NgModule({
  imports: [
    SharedModule,
    OntimizeWebModule,
    HomeRoutingModule,
    CompetitionsModule
  ],
  declarations: [
    HomeComponent,
  ]
})
export class HomeModule {

}
