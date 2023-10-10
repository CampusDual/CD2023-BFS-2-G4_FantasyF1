import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';

import { SharedModule } from '../../shared/shared.module';
import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';
import { CompetitionsNewComponent } from '../competitions/competitions-new/competitions-new.component';
import { CompetitionsAvailableComponent } from '../competitions/competitions-available/competitions-available.component';
import { CompetitionsHomeComponent } from '../competitions/competitions-home/competitions-home.component';
import { CompetitionsDetailComponent } from '../competitions/competitions-detail/competitions-detail.component';

@NgModule({
  imports: [
    SharedModule,
    OntimizeWebModule,
    HomeRoutingModule
  ],
  declarations: [
    HomeComponent,
    CompetitionsNewComponent,
    CompetitionsAvailableComponent,
    CompetitionsHomeComponent,
    CompetitionsDetailComponent
  ]
})
export class HomeModule {

}
