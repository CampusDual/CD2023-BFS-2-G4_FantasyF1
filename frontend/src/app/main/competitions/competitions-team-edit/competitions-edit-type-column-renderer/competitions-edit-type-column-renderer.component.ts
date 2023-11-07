import { Component, Injector, Input, TemplateRef, ViewChild } from '@angular/core';
import { DialogService, OBaseTableCellRenderer, OTranslateService, OntimizeService, SnackBarService } from 'ontimize-web-ngx';
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

  constructor(
    protected injector2: Injector, 
    protected injector: Injector,
    public childService: CompetitionData, 
    private router: Router,
    protected snackService: SnackBarService,
    protected dialogService: DialogService,
    private translator: OTranslateService

  ) {
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

  buyDriver(pilId, pilPrice) {

    if (this.childService.getPilotsUserCount() >= 2) {
      this.snackService.open("ALREADY_2_DRIVERS");
    }
    else {
      if (this.childService.moneyUser < pilPrice) {
        this.snackService.open("NOT_ENOUGH_MONEY");
      } else {
        this.service.insert({
          "COMP_ID": this.childService.compID, "UC_ID": this.childService.ucID,
          "PIL_ID": pilId, "PIL_PRICE": pilPrice
        },
          "userCompetitionPilot").subscribe(
            resp => {
              this.snackService.open("PILOT_PURCHASED");
              this.childService.triggerDataUpdate();
              console.log("Compra y recarga realizada");
            },
            err => {
              this.snackService.open("USER_HAS_PILOT_CHECK");
              this.childService.triggerDataUpdate();
              console.log("No compra pero recarga realizada");
            }
          )
      }
    }
  }

  sellDriver(ucpId, pilId) {
    this.service.update(
      { "UCP_ID": ucpId },
      {
        "UC_ID": this.childService.ucID, "PIL_ID": pilId
      }, "userCompetitionPilot").subscribe(resp => {
        this.snackService.open("PILOT_SOLD");
        this.childService.triggerDataUpdate();
      })
  }

  showSellConfirm(evt: any, ucpId, pilId){
    if(this.dialogService){
      this.dialogService.confirm(this.translator.get('CONFIRM_SELL'), this.translator.get('WANT_SELL'));
      this.dialogService.dialogRef.afterClosed().subscribe(result => {
        if(result){
          this.sellDriver(ucpId, pilId);
        }
      })
    }
  }

  showBuyConfirm(evt: any, pilId, pilPrice){
    if(this.dialogService){
      this.dialogService.confirm(this.translator.get('CONFIRM_BUY'), this.translator.get('WANT_BUY'));
      this.dialogService.dialogRef.afterClosed().subscribe(result => {
        if(result){
          this.buyDriver(pilId, pilPrice);
        }
      })
    }
  }
}
