import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-competitions-detail',
  templateUrl: './competitions-detail.component.html',
  styleUrls: ['./competitions-detail.component.scss']
})
export class CompetitionsDetailComponent implements OnInit {

  @ViewChild("code_panel", { static: true }) code_panel: OTextInputComponent;

  dataCompetition: {}; 
  arrayPilots: Array<any> = [];

  isEditable:boolean = false;
  isPrivate:boolean = true;
  
  constructor(
    protected service: OntimizeService,
    private router: Router
    ) {}

  ngOnInit() {
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('users_competitions');
    this.service.configureService(conf);
  }

  showButton(data){

    let sessionData = localStorage.getItem("com.ontimize.web.ngx.jee.seed");
    let sessionUser = JSON.parse(sessionData).session["user"];

    for(let element of data){
      if (element.USER_ === sessionUser ){
        this.isEditable=true ;
      }
    }
  }

  showPanelCode(data){
    this.dataCompetition=data;
    if (data.COMP_CODE === "") {
      this.isPrivate=false
    } 
  }

  joinLeague(){
    let sessionData = localStorage.getItem("com.ontimize.web.ngx.jee.seed");
    let sessionUser = JSON.parse(sessionData).session["user"];
    this.service.insert({ "COMP_ID": this.dataCompetition["COMP_ID"] }, "userCompetitionJoin" )
      .subscribe(resp => {
      this.router.navigate(['/main/home/', this.dataCompetition["COMP_ID"]]);
    });
  }

  editTeam(){
   this.queryUserPilots();
  }

  queryUserPilots(){
    this.service.query({},["P1SURNAME", "P2SURNAME", "UC_AVAILABLE_MONEY" ], "teamDetails").subscribe(resp => {
      console.log("pilotos user ");
      console.log(resp.data[0].P1SURNAME);
      console.log(resp.data[0].P2SURNAME);
      console.log(resp.data[0].UC_AVAILABLE_MONEY);  
    })
  }


}
