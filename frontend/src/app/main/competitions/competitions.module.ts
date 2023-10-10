import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { CompetitionsRoutingModule } from './competitions-routing.module';
import { CompetitionsHomeComponent } from './competitions-home/competitions-home.component';
import { CompetitionsNewComponent } from './competitions-new/competitions-new.component';
import { CompetitionsSearchComponent } from './competitions-search/competitions-search.component';
import { CompetitionsAvailableComponent } from './competitions-available/competitions-available.component';
import { CompetitionsDetailComponent } from './competitions-detail/competitions-detail.component';


@NgModule({
  declarations: [CompetitionsHomeComponent, CompetitionsNewComponent, CompetitionsSearchComponent, CompetitionsAvailableComponent, CompetitionsDetailComponent],
  imports: [
    CommonModule,
    OntimizeWebModule,
    CompetitionsRoutingModule
  ],
  exports: [
    CompetitionsNewComponent,
    CompetitionsAvailableComponent,
    CompetitionsHomeComponent
  ]
})
export class CompetitionsModule { }
