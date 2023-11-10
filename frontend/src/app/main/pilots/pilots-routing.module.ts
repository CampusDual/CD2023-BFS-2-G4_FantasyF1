import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PilotsHomeComponent } from './pilots-home/pilots-home.component';


const routes: Routes = [{
  path: '',
  component: PilotsHomeComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PilotsRoutingModule { }
