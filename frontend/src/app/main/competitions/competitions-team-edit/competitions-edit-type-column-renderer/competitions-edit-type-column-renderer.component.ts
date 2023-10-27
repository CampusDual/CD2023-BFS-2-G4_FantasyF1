import { Component, Injector, Input, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer, OntimizeService, SnackBarService } from 'ontimize-web-ngx';
import { CompetitionData } from '../competition-data.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-competitions-edit-type-column-renderer',
  templateUrl: './competitions-edit-type-column-renderer.component.html',
  styleUrls: ['./competitions-edit-type-column-renderer.component.css']
})
export class CompetitionsEditTypeColumnRendererComponent extends OBaseTableCellRenderer {

  @Input() childMessage: number;
  @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;
  protected service: OntimizeService;
  username: string = "";

  constructor(protected injector2: Injector, protected injector: Injector,
    public childService: CompetitionData, private router: Router,
    protected snackService: SnackBarService
    ){
    super(injector);
    this.service = this.injector2.get(OntimizeService);
  }

  ngOnInit() {
    let sessionData = localStorage.getItem("com.ontimize.web.ngx.jee.seed");
    this.username = JSON.parse(sessionData).session["user"];
    
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('users_competitions_pilots');
    this.service.configureService(conf);
  }

  buyDriver(pilId, pilPrice){
   
    if (this.childService.getPilotsUserCount()>=2) {
      this.snackService.open( "ALREADY_2_DRIVERS");
     }
    else{
      if (this.childService.moneyUser < pilPrice){
      this.snackService.open( "NOT_ENOUGH_MONEY");
    } else{
      
     this.service.insert({
      "COMP_ID": this.childService.compID,"UC_ID": this.childService.ucID,
      "UC_AVAILABLE_MONEY":this.childService.moneyUser,"PIL_ID":pilId, "PIL_PRICE":pilPrice},
      "userCompetitionPilot").subscribe(
        resp => {
          this.snackService.open("PILOT_PURCHASED");
          this.childService.triggerDataUpdate();
        }, 
        err => {
        this.snackService.open("USER_HAS_PILOT_CHECK");
        this.childService.triggerDataUpdate();
          }
        )
      }
     }
  }

  sellDriver(ucpId, pilId, pilPrice){
    this.service.delete(
      {"UCP_ID": ucpId, "UC_ID": this.childService.ucID, "UC_AVAILABLE_MONEY":this.childService.moneyUser,
      "PIL_ID":pilId, "PIL_PRICE":pilPrice }, "userCompetitionPilot").subscribe(resp => {
      this.snackService.open("PILOT_SOLD");
      this.childService.triggerDataUpdate();
    })
  }


}
