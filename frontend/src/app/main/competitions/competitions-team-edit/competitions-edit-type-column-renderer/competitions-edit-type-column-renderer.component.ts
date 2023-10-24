import { Component, Injector, Input, TemplateRef, ViewChild } from '@angular/core';
import { DialogService, OBaseTableCellRenderer, OntimizeService } from 'ontimize-web-ngx';
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

  constructor(protected injector2: Injector, protected injector: Injector, public childService: CompetitionData, private router: Router, protected dialogService: DialogService) {
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
    if (this.childService.moneyUser < pilPrice){
      this.dialogService.warn("ERROR", "NOT_ENOUGH_MONEY");
    } else{
        this.service.insert({ "UC_ID": this.childService.ucID ,  "PIL_ID": pilId }, "userCompetitionPilot").subscribe(resp => {
          this.router.navigate(['/main/home/', this.childService.compID]); //TODO conseguir que navegue a la página de edición de equipo
        })
    }
  }

  sellDriver(ucpId){
    this.service.delete({ "UCP_ID": ucpId }, "userCompetitionPilot").subscribe(resp => {
      this.router.navigate(['/main/home/', this.childService.compID]); //TODO conseguir que navegue a la página de edición de equipo
    })
  }


}
