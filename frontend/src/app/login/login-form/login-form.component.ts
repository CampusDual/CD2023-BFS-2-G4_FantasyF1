import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { LoginFormService } from './login-form.service';
import { OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.css']
})
export class LoginFormComponent implements OnInit {

  @ViewChild('nickname', { static: true }) nickname: OTextInputComponent;
  @ViewChild('password', { static: true }) password: OTextInputComponent;
  @ViewChild('password2', { static: true }) password2: OTextInputComponent;
  @ViewChild('name', { static: true }) name: OTextInputComponent;
  @ViewChild('surname', { static: true }) surname: OTextInputComponent;
  @ViewChild('email', { static: true }) email: OTextInputComponent;
  @ViewChild('nif', { static: true }) nif: OTextInputComponent;

  protected service: OntimizeService;

  constructor(
    private modalSS: LoginFormService,
    protected injector: Injector,
    ) {
      this.service = this.injector.get(OntimizeService);
     }

  ngOnInit() {
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('users');
    this.service.configureService(conf);
  }

  closeModal(){
    this.modalSS.$modal.emit(false);
    alert("Se cierra la ventana");
  }

  insertUser(){
    this.modalSS.$modal.emit(false);
    if(this.checkPasswords()){
      this.service.insert(
        {"USER_": this.nickname.getValue(), "PASSWORD": this.password.getValue()},
        "user").subscribe(resp => {
      if(resp.code === 0){
        alert("El usuario ya existe en la base de datos");
      }else {
        alert("No existe el registro");
      }
    });
    } else {
      alert("Las contraseñas no coinciden");
    }
  }
  

  checkPasswords(): Boolean{
    return this.password.getValue() === this.password2.getValue();
  }

}
