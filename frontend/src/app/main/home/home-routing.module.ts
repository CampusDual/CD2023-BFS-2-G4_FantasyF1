import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './home.component';
import { CompetitionsNewComponent } from '../competitions/competitions-new/competitions-new.component';
import { CompetitionsDetailComponent } from '../competitions/competitions-detail/competitions-detail.component';

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
    path: ':UC_ID',
    component: CompetitionsDetailComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HomeRoutingModule { }
