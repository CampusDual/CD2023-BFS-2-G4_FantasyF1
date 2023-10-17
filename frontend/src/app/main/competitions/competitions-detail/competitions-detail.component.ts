import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';
import { ServiceLoginService } from 'src/app/shared/service-login.service';

@Component({
  selector: 'app-competitions-detail',
  templateUrl: './competitions-detail.component.html',
  styleUrls: ['./competitions-detail.component.scss']
})
export class CompetitionsDetailComponent implements OnInit {

  protected service: OntimizeService;

  dataCompetition: {}; 

  @ViewChild("code_panel", { static: true }) code_panel: OTextInputComponent;

  isEditable:boolean = false;

  isPrivate:boolean = true;

  isTabVisible: boolean = false;
  
  constructor(private serviceLoginService : ServiceLoginService, protected injector: Injector, private router: Router) {
    this.service = this.injector.get(OntimizeService);
   }

  ngOnInit() {
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('users_competitions');
    this.service.configureService(conf);
  }

  showButton(data){

    for(let element of data){
      if (element.USER_ === this.serviceLoginService.getUserName() ){
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
    
    this.service.insert({ "COMP_ID": this.dataCompetition["COMP_ID"], "USER_": this.serviceLoginService.getUserName()}, "userCompetition" ).
    subscribe(resp => {
      this.router.navigate(['/main/home/', this.dataCompetition["COMP_ID"]]);
    });
  }

  editTeam(){
    this.isTabVisible=true;
  }


}
