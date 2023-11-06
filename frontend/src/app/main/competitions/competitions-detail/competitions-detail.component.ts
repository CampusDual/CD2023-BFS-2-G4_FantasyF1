import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { DialogService, OFormComponent, OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';
import { LineChartConfiguration, OChartComponent } from 'ontimize-web-ngx-charts';

declare var d3: any;

@Component({
  selector: 'app-competitions-detail',
  templateUrl: './competitions-detail.component.html',
  styleUrls: ['./competitions-detail.component.scss']
})
export class CompetitionsDetailComponent implements OnInit {

  @ViewChild("code_panel", { static: true }) code_panel: OTextInputComponent;
  @ViewChild("form_component", { static: true }) form_component: OFormComponent;
  @ViewChild('lineChart', { static: true }) lineChart: OChartComponent;

  public lineChartParametersSerie: LineChartConfiguration;
  arrayParaLaGrafica: Object;
  namesUsersCompetitionForGraph: string = "";

  dataCompetition: {};
  dataTable: any;
  arrayPilots: Array<any> = [];

  isEditable: boolean = false;
  isPrivate: boolean = true;
  readonly MAX_ALLOWED_USERS: number = 9;

  constructor(
    protected service: OntimizeService,
    private router: Router,
    protected dialogService: DialogService,
  ) {
    this.lineChartParametersSerie = new LineChartConfiguration();
    this.lineChartParametersSerie.legend.vers = 'furious';
    this.lineChartParametersSerie.legendPosition = 'bottom';
    //this.lineChartParametersSerie.isArea = [true];
    this.lineChartParametersSerie.color = ['rgb(67, 6, 128)'];
    //this.lineChartParametersSerie.showLegend = true;
    //this.lineChartParametersSerie.
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
    this.router.navigate(['/main/competitions/edit', this.dataCompetition["COMP_ID"]]);
  }


  ///LÓGICA PARA LAS GRÁFICAS///
  loadDataTableForChart(respuesta) {

    //Creamos un nuevo array para la gráfica usando la info que nos trae la tabla
    console.log(respuesta);
    this.arrayParaLaGrafica = []
    const rounds = Array.from(new Set(respuesta.map(r => r["RAC_ROUND"])));
    const users: Array<string> = Array.from(new Set(respuesta.map(r => r["USER_"])));
    let round_data = rounds
      .map(rac_round => {
        let resp = { rac_round, };
        for (let user of users) {
          let user_points = respuesta.find(r => r["RAC_ROUND"] === rac_round && r["USER_"] === user);
          if (!user_points) {
            resp[user] = 0;
          } else {
            resp[user] = user_points["TOTAL_POINTS"];
          }
        }
        console.table(resp);
        return resp;
      })
    console.log(round_data);
    this.arrayParaLaGrafica = {
      data: round_data
    }

    //Añadimos los users de la competición al string de la gráfica
    this.namesUsersCompetitionForGraph = users.join(";")

    //Añadimos los datos a la gráfica
    console.log(this.namesUsersCompetitionForGraph);
    console.log(this.arrayParaLaGrafica);
    //this.lineChart.setData(this.arrayParaLaGrafica);
    //let adapter = this.lineChart.getAdaptData();
    this.lineChart.setDataArray(this.arrayParaLaGrafica);
    this.lineChart.reloadData();
  }


}