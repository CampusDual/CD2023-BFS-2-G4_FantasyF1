import { Component, Inject, Injector, OnInit, ViewChild } from '@angular/core';
import { RegisterService } from './register.service';
import { AuthService, DialogService, OTextInputComponent, OTranslateService, OntimizeService } from 'ontimize-web-ngx';
import { ActivatedRoute, Router } from '@angular/router';

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
    protected dialogService: DialogService,
    private translator: OTranslateService,
    private router: Router
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
  }

  insertUser(){
    const nickname = this.nickname.getValue();
    const password = this.password.getValue();
    const password2 = this.password2.getValue();
    const email = this.email.getValue();

    if(
      this.checkNotEmptyFields(nickname) &&
      this.checkNotEmptyFields(password) && 
      this.checkNotEmptyFields(password2) &&
      this.checkNotEmptyFields(email)){
        if(this.checkEqualPasswords(password, password2)){
          if(!this.checkEmailFormat(email)){
            this.dialogService.error(this.translator.get('REGISTER'), this.translator.get('EMAIL_FORMAT_INCORRECT'));
            this.modalSS.$modal.emit(true);
          } else{
            const columns = ["EMAIL"]; 
            this.service.query({"EMAIL":email}, columns, "userEmail").subscribe(
              respuesta => {
                if(respuesta.data[0] !== undefined){
                  this.dialogService.error(this.translator.get('REGISTER'), this.translator.get('DATA_EXISTS'));
                  this.modalSS.$modal.emit(true);
                } else {
                  this.service.insert(
                    {"USER_": nickname, "PASSWORD": password, "EMAIL":email},
                    "userRegister").subscribe(
                      resp => {
                        this.dialogService.info(this.translator.get('REGISTER'), 'USER_REGISTER_OK');
                        this.modalSS.$modal.emit(false);
                      },
                      err => {
                        this.dialogService.error(this.translator.get('REGISTER'), this.translator.get('DATA_EXISTS'));
                        this.modalSS.$modal.emit(true);
                      });
                }
              }
            )
          }
        } else{
          this.dialogService.error(this.translator.get('REGISTER'), this.translator.get('PASSWORD_NOT_MATCH'));
          this.modalSS.$modal.emit(true);
        } 
    } else {
      this.dialogService.error(this.translator.get('REGISTER'), this.translator.get('EMPTY_FIELD'));
      this.modalSS.$modal.emit(true);
    }
  }

  checkNotEmptyFields(password: String): Boolean{
    if(password.length > 0){
      return true;
    } else{
      return false;
    } 
  }

  checkEqualPasswords(password: String, password2: String){
    return password === password2;
  }

  checkEmail(): Boolean{
    return this.email.getValue() === this.email.getValue();
  }

  checkEmailFormat(email: String): Boolean{
    const EMAIL_REGEX = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    if (email.match(EMAIL_REGEX)){
      return true;
    } else {
      return false;
    }
  }
}
