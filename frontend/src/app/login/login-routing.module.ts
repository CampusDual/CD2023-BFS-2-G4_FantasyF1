import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { LoginComponent } from './login.component';
import { LoginFormComponent } from './login-form/login-form.component';
import { AuthGuardService } from 'ontimize-web-ngx';

const routes: Routes = [
  {
     path: '', 
     component: LoginComponent
  },
  {
    path: 'form', 
    component: LoginFormComponent,
    canActivate: [AuthGuardService]
 },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LoginRoutingModule { }
