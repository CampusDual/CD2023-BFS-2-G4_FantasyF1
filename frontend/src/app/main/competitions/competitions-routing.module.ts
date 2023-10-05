import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CompetitionsHomeComponent } from './competitions-home/competitions-home.component';
import { CompetitionsDetailComponent } from './competitions-detail/competitions-detail.component';


const routes: Routes = [{
  path: '',
  component: CompetitionsHomeComponent
},{
  path: ":COMP_ID",
  component: CompetitionsDetailComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CompetitionsRoutingModule { }
