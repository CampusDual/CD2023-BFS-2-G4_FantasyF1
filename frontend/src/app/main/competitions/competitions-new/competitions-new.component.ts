import { Component, OnInit, ViewChild } from '@angular/core';
import { OComboComponent, OTextInputComponent, OTranslateService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-new_competition',
  templateUrl: './competitions-new.component.html',
  styleUrls: ['./competitions-new.component.css']
})
export class CompetitionsNewComponent implements OnInit {

  @ViewChild('type_combo', { static: true }) type_combo: OComboComponent;
  @ViewChild('league_code', { static: false }) league_code: OTextInputComponent;

  public isPrivate: boolean = false;

  public staticData = [{
    value: true,
    name:this.translator.get("PUBLIC")
  }, {
    value: false,
    name: this.translator.get("PRIVATE")
  }];

  public staticColors = [{
    value: "assets/images/comp_img_red.png",
    name: this.translator.get("RED")
  },
  {
    value: "assets/images/comp_img_blue.png",
    name: this.translator.get("BLUE")
  }, 
  {
    value: "assets/images/comp_img_green.png",
      name: this.translator.get("GREEN")
  }, 
  {
      value: "assets/images/comp_img_black.png",
      name: this.translator.get("BLACK")
  }];

  public texto: string = this.asignarVar();

  constructor(private translator: OTranslateService) {
  }

  ngOnInit() {
  }

  asignarVar(): string {
    const date = new Date();
    let sessionData = localStorage.getItem("com.ontimize.web.ngx.jee.seed");
    let sessionUser = JSON.parse(sessionData).session["user"];
    let numRandom = Math.floor(Math.random() * (10000 - 0 + 1)) + 0;
    let fecha: string = `${date.getHours()}${date.getMinutes()}${date.getSeconds()}${numRandom}${date.getDate()}${date.getMonth()}${date.getFullYear()}`
    let code: string = `${fecha}${sessionUser}`;
    return code;
  }

  changeType() {
    if (this.type_combo.getValue() === false) {
      document.getElementById('codigo').classList.remove("code_form");
      this.league_code.setValue(this.texto);
    } else {
      document.getElementById('codigo').classList.add("code_form")
      this.league_code.setValue("");

    }
  }


}
