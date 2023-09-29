import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';

import { SharedModule } from '../../shared/shared.module';
import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';
import { PilotComponent } from './pilot/pilot.component';
import { InicioComponent } from './inicio/inicio.component';
import { New_competitionComponent } from './new_competition/new_competition.component';

@NgModule({
  imports: [
    SharedModule,
    OntimizeWebModule,
    HomeRoutingModule
  ],
  declarations: [
    HomeComponent,
    PilotComponent,
    InicioComponent,
    New_competitionComponent
  ]
})
export class HomeModule { 

}
