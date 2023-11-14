import { Component, Inject, Injector, OnInit, ViewChild } from '@angular/core';
import { RegisterService } from './register.service';
import { AuthService, OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-register-home',
  templateUrl: './register-home.component.html',
  styleUrls: ['./register-home.component.css']
})
export class RegisterHomeComponent implements OnInit {

  @ViewChild('nickname', { static: true }) nickname: OTextInputComponent;
  @ViewChild('password', { static: true }) password: OTextInputComponent;
  @ViewChild('password2', { static: true }) password2: OTextInputComponent;
  @ViewChild('name', { static: true }) name: OTextInputComponent;
  @ViewChild('surname', { static: true }) surname: OTextInputComponent;
  @ViewChild('email', { static: true }) email: OTextInputComponent;
  @ViewChild('nif', { static: true }) nif: OTextInputComponent;

  protected service: OntimizeService;

  constructor(
    private modalSS: RegisterService,
    protected injector: Injector,
    private actRoute: ActivatedRoute,
    @Inject(AuthService)
    private authService: AuthService,
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
      alert("Entra en el insert");
      this.service.insert(
        {"USER_": this.nickname.getValue(), "PASSWORD": this.password.getValue()},
        "userRegister").subscribe(
          resp => {
            alert("Usuario registrado correctamente");
          },
          err => {
            alert("Ha ocurrido un problema");
          });
    } else {
      alert("Las contraseñas no coinciden");
    }
  }
  

  checkPasswords(): Boolean{
    return this.password.getValue() === this.password2.getValue();
  }

}
