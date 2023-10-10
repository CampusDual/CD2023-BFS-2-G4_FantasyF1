import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AvailableHomeComponent } from './available-home/available-home.component';


const routes: Routes = [
  {
    path: '',
    component: AvailableHomeComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AvailableRoutingModule { }
