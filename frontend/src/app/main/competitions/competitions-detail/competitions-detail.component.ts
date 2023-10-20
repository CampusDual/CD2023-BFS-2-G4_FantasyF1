import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { DialogService, OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-competitions-detail',
  templateUrl: './competitions-detail.component.html',
  styleUrls: ['./competitions-detail.component.scss']
})
export class CompetitionsDetailComponent implements OnInit {

  @ViewChild("code_panel", { static: true }) code_panel: OTextInputComponent;

  dataCompetition: {}; 
  dataTable: any; 
  arrayPilots: Array<any> = [];

  isEditable:boolean = false;
  isPrivate:boolean = true;
  
  constructor(
    protected service: OntimizeService,
    private router: Router,
    protected dialogService: DialogService
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

  loadDataTable(data){
    this.dataTable=data;
  }

  joinLeague(){
    if(this.dataTable.length>9){
      this.dialogService.info("UNAVAILABLE_LEAGUE_TITLE",  "UNAVAILABLE_LEAGUE_LIMIT_USERS")
    } else{
      this.service.insert({ "COMP_ID": this.dataCompetition["COMP_ID"] }, "userCompetitionJoin" )
      .subscribe(resp => {
      this.router.navigate(['/main/home/', this.dataCompetition["COMP_ID"]]);
    });
    }
  }

  editTeam(){
   this.router.navigate(['/main/competitions/edit', this.dataCompetition["COMP_ID"]]);
  }

  


}
