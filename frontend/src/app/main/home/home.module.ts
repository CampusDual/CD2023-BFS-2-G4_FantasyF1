import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';

import { SharedModule } from '../../shared/shared.module';
import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';
import { PilotComponent } from '../pilot/pilot.component';
import { CompetitionsNewComponent } from '../competitions/competitions-new/competitions-new.component';
import { CompetitionsAllComponent } from '../competitions/competitions-all/competitions-all.component';

@NgModule({
  imports: [
    SharedModule,
    OntimizeWebModule,
    HomeRoutingModule
  ],
  declarations: [
    HomeComponent,
    PilotComponent,
    CompetitionsNewComponent,
    CompetitionsAllComponent
  ]
})
export class HomeModule {

}
