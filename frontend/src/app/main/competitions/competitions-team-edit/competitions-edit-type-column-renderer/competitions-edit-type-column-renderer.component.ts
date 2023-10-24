import { Component, Injector, Input, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer, OntimizeService } from 'ontimize-web-ngx';

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

  constructor(protected injector2: Injector, protected injector: Injector) {
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

  buyDriver(pilId, ucId){
    console.log(pilId, ucId, this.childMessage);
    //this.service.insert("PIL_ID": pilId, "UC_ID": ucId, "userCompetitionPilot", )
    
    
  }

  sellDriver(pilId){
    alert("vendido")
  }


}
