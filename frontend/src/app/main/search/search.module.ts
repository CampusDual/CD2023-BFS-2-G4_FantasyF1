import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { SearchRoutingModule } from './search-routing.module';
import { SearchPrivateComponent } from './search-private/search-private.component';


@NgModule({
  declarations: [SearchPrivateComponent],
  imports: [
    CommonModule,
    OntimizeWebModule,
    SearchRoutingModule
  ]
})
export class SearchModule { }
