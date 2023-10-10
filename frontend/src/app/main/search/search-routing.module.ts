import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SearchPrivateComponent } from './search-private/search-private.component';


const routes: Routes = [{
  path: '',
  component: SearchPrivateComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SearchRoutingModule { }
