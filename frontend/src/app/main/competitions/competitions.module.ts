import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CompetitionsRoutingModule } from './competitions-routing.module';
import { CompetitionsHomeComponent } from './competitions-home/competitions-home.component';
import { CompetitionsNewComponent } from './competitions-new/competitions-new.component';


@NgModule({
  declarations: [CompetitionsHomeComponent, CompetitionsNewComponent],
  imports: [
    CommonModule,
    CompetitionsRoutingModule
  ]
})
export class CompetitionsModule { }
