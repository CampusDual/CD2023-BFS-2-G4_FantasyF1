import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CompetitionsHomeComponent } from './competitions-home/competitions-home.component';
import { CompetitionsDetailComponent } from './competitions-detail/competitions-detail.component';
import { CompetitionsAvailableComponent } from './competitions-available/competitions-available.component';
import { CompetitionsSearchComponent } from './competitions-search/competitions-search.component';
import { CompetitionsNewComponent } from './competitions-new/competitions-new.component';
import { CompetitionsTeamEditComponent } from './competitions-team-edit/competitions-team-edit.component';
import { CompetitionsResultsHistoryComponent } from './competitions-results-history/competitions-results-history.component';


const routes: Routes = [{
  path: 'home',
  component: CompetitionsHomeComponent
},
{
  path: 'available',
  component: CompetitionsAvailableComponent
},
{
  path: 'new',
  component: CompetitionsNewComponent
},
{
  path: 'search',
  component: CompetitionsSearchComponent
},
{
  path: 'edit/:COMP_ID',
  component: CompetitionsTeamEditComponent
},
{
  path: 'available/:COMP_ID',
  component: CompetitionsDetailComponent
},
{
  path: 'available/:COMP_ID/:UC_ID',
  component: CompetitionsResultsHistoryComponent
},
{
  path: 'home/:COMP_ID',
  component: CompetitionsDetailComponent
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CompetitionsRoutingModule { }
