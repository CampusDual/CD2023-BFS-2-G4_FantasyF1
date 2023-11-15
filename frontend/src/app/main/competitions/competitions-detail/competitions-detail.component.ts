import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { DialogService, OFormComponent, OTextInputComponent, OTranslateService, OntimizeService, SnackBarService } from 'ontimize-web-ngx';
import { LineChartConfiguration, OChartComponent } from 'ontimize-web-ngx-charts';

declare var d3: any;

@Component({
  selector: 'app-competitions-detail',
  templateUrl: './competitions-detail.component.html',
  styleUrls: ['./competitions-detail.component.scss']
})
export class CompetitionsDetailComponent implements OnInit {

  @ViewChild("code_panel", { static: true }) code_panel: ElementRef;
  @ViewChild("form_component", { static: true }) form_component: OFormComponent;
  @ViewChild('lineChart', { static: true }) lineChart: OChartComponent;

  lineChartParametersSerie: LineChartConfiguration;
  namesUsersCompetitionForGraph: string = "";

  dataCompetition: {};
  dataTable: any;

  isEditable: boolean = false;
  isPrivate: boolean = true;
  readonly MAX_ALLOWED_USERS: number = 9;

  constructor(
    protected service: OntimizeService,
    private router: Router,
    protected dialogService: DialogService,
    private translator: OTranslateService,
    protected snackService: SnackBarService
  ) {
    this.lineChartParametersSerie = new LineChartConfiguration();
    this.lineChartParametersSerie.legend.vers = 'furious';
    this.lineChartParametersSerie.legendPosition = 'bottom';
    this.lineChartParametersSerie.showLegend = true;
    this.lineChartParametersSerie.x1Axis.axisLabel = this.translator.get('LINE_CHART_XAXIS');
    this.lineChartParametersSerie.y1Axis.axisLabel = this.translator.get('LINE_CHART_YAXIS');
  }

  ngOnInit() {
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('users_competitions');
    this.service.configureService(conf);
  }

  showButton(data) {
    let sessionData = localStorage.getItem("com.ontimize.web.ngx.jee.seed");
    let sessionUser = JSON.parse(sessionData).session["user"];

    for (let element of data) {
      if (element.USER_ === sessionUser) {
        this.isEditable = true;
      }
    }
  }

  showPanelCode(data) {
    this.dataCompetition = data;
    if (data.COMP_CODE === "") {
      this.isPrivate = false
      this.code_panel.nativeElement.style.display = 'none';
    }
  }

  loadDataTable(data) {
    this.dataTable = data;
  }

  joinLeague() {
    if (this.dataTable.length > this.MAX_ALLOWED_USERS) {
      this.dialogService.info("UNAVAILABLE_LEAGUE_TITLE", "UNAVAILABLE_LEAGUE_LIMIT_USERS")
    } else {
      this.service.insert({ "COMP_ID": this.dataCompetition["COMP_ID"] }, "userCompetitionJoin")
        .subscribe(resp => {
          this.form_component.reload(true);
        });
    }
  }

  editTeam() {
    const competitionId = this.dataCompetition["COMP_ID"];
    const url = `/main/competitions/edit/${competitionId}?isdetail=true`;
    this.router.navigateByUrl(url);
  }

  loadDataTableForGraph(data: Array<any>) {
    
    const users: Array<string> = Array.from(new Set(data.map(r => r["USER_"])));
    this.namesUsersCompetitionForGraph = users.join(";")
    let graphArray: Array<Object> = [];
    let filterForUsers: Array<String> = [];
  
    if (data.length===0) {
      document.getElementById("lineGraph").classList.add("hideGraph")
      document.getElementById("infoNoData").classList.remove("hiddenInfo")
    } else{
      document.getElementById("lineGraph").classList.remove("hideGraph")
      document.getElementById("infoNoData").classList.add("hiddenInfo")
      for (let eachRecordOfData of data) {
        let accumulatedPointsPerRound: number = 0;
        if (!filterForUsers.includes(eachRecordOfData["USER_"])) {
          let objectForEachUser = {
            key: eachRecordOfData["USER_"]
          }
          let values = []
          for(let i=0; i<eachRecordOfData["RAC_ROUND"]; i++){
            values.push({ x: i, y: 0 })
          }
          for (let r2 of data) {
            if (r2["USER_"] === eachRecordOfData["USER_"]) {
              accumulatedPointsPerRound = accumulatedPointsPerRound + r2["TOTAL_POINTS"];
              values.push({ x: r2["RAC_ROUND"], y: accumulatedPointsPerRound })
            }
          }
          objectForEachUser["values"] = values;
          graphArray.push(objectForEachUser);
          filterForUsers.push(eachRecordOfData["USER_"])
        }
      }
      this.lineChart.setDataArray(graphArray);
      this.lineChart.reloadData();
    }
  }

}