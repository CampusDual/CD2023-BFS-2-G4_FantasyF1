import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './home.component';
import { CompetitionsDetailComponent } from '../competitions/competitions-detail/competitions-detail.component';
import { CompetitionsResultsHistoryComponent } from '../competitions/competitions-results-history/competitions-results-history.component';
import { CompetitionsNewComponent } from '../competitions/competitions-new/competitions-new.component';

const routes: Routes = [
  {
    path: '',
    component: HomeComponent
  },
  {
    path: 'new',
    component: CompetitionsNewComponent
  },
  {
    path: ':COMP_ID',
    component: CompetitionsDetailComponent
  },
  {
    path: ':COMP_ID/:UC_ID',
    component: CompetitionsResultsHistoryComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HomeRoutingModule { }
