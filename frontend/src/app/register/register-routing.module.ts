import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RegisterHomeComponent } from './register-home/register-home.component';
import { AuthGuardService } from 'ontimize-web-ngx';


const routes: Routes = [
  {
    path: '', 
    component: RegisterHomeComponent,
 },
 {
   path: 'register', 
   component: RegisterHomeComponent,
   canActivate: [AuthGuardService]
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RegisterRoutingModule { }
