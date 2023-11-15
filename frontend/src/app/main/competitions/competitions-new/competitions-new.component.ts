import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { MatDialogRef } from '@angular/material';
import { Router } from '@angular/router';
import { OComboComponent, OTextInputComponent, OTranslateService, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-new_competition',
  templateUrl: './competitions-new.component.html',
  styleUrls: ['./competitions-new.component.css']
})
export class CompetitionsNewComponent implements OnInit {

  @ViewChild('compName', { static: true }) compName: OTextInputComponent;
  @ViewChild('compDescription', { static: true }) compDescription: OTextInputComponent;
  @ViewChild('type_combo', { static: true }) type_combo: OComboComponent;
  @ViewChild('league_code', { static: false }) league_code: OTextInputComponent;

  protected service: OntimizeService;
  public isPrivate: boolean = false;

  public staticData = [{
    value: true,
    name: this.translator.get("PUBLIC")
  }, {
    value: false,
    name: this.translator.get("PRIVATE")
  }];

  public texto: string = this.asignarVar();

  constructor(protected injector: Injector, private translator: OTranslateService, private router: Router, public dialogRef: MatDialogRef<CompetitionsNewComponent>) {
    this.service = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('competitions');
    this.service.configureService(conf);
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

  addCompetition() {
    const compName = this.compName.getValue();
    const compDescription = this.compDescription.getValue();
    const type_combo = this.type_combo.getValue();
    const league_code = this.league_code.getValue();

    console.log(compName);
    console.log(compDescription);
    console.log(type_combo);
    console.log(league_code);

    this.service.insert({ "COMP_NAME": compName, "COMP_DESCRIPTION": compDescription, "COMP_CODE": league_code, "COMP_ISPUBLIC": type_combo }
      , "competition").subscribe(resp => {
        const competitionId = resp.data.COMP_ID;
        const url = `/main/home/${competitionId}?isdetail=true`;
        this.router.navigateByUrl(url);
        this.dialogRef.close();
      });
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
