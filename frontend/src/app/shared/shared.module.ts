import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { CompetitionsEditTypeColumnRendererComponent } from '../main/competitions/competitions-team-edit/competitions-edit-type-column-renderer/competitions-edit-type-column-renderer.component';

@NgModule({
  imports: [
    OntimizeWebModule
  ],
  declarations: [
    CompetitionsEditTypeColumnRendererComponent
  ],
  exports: [
    CommonModule,
    CompetitionsEditTypeColumnRendererComponent
  ]
})
export class SharedModule { }
