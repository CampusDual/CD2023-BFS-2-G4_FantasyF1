import { Component, OnInit, ViewChild } from '@angular/core';
import { OTranslateService } from 'ontimize-web-ngx';
import { ChartService, MultiBarChartConfiguration, OChartComponent } from 'ontimize-web-ngx-charts';

@Component({
  selector: 'app-competitions-results-history',
  templateUrl: './competitions-results-history.component.html',
  styleUrls: ['./competitions-results-history.component.css']
})
export class CompetitionsResultsHistoryComponent implements OnInit {

  @ViewChild('multiBarChart', { static: true }) multiBarChart: OChartComponent;
  username: String;
  multiBarConfig: MultiBarChartConfiguration;

  constructor( private translator: OTranslateService
    ) {
    this.multiBarConfig = new MultiBarChartConfiguration();
    this.multiBarConfig.stacked = false;
    this.multiBarConfig.legend.vers = 'furious';
    this.multiBarConfig.showControls = false;
    this.multiBarConfig.legend.margin.top = 5;
    this.multiBarConfig.x1Axis.axisLabel=this.translator.get('BAR_CHART_XAXIS');
    this.multiBarConfig.y1Axis.axisLabel=this.translator.get('BAR_CHART_YAXIS');
  }

  ngAfterViewInit(): void {
    if (this.multiBarChart) {
      let chartService: ChartService = this.multiBarChart.getChartService();
      let chartOps = chartService.getChartOptions();
      chartOps["yDomain"] = [-5, 25];
    }
  }

  ngOnInit() {

  }

  loadDataTable(data) {
    this.username = data[0].USER_;
    let a = data.filter(el => Number.isInteger(el["TOTAL_POINTS"]));
    data['ACCUMULATED'] = 0;
    let b = 0;
    for (let i = 0; i < a.length; i++) {
      b = b + a[i]["TOTAL_POINTS"];
      data[i]['ACCUMULATED'] = b;
    }
  }

  loadDataTableForChart(data) {
    let graphArray: Array<Object> = [];
    let filterForPilots: Array<String> = [];

    if (data.length === 0) {
      document.getElementById("barGraph").classList.add("hideGraph")
      document.getElementById("infoNoData").classList.remove("hiddenInfo")
    } else {
      document.getElementById("barGraph").classList.remove("hideGraph")
      document.getElementById("infoNoData").classList.add("hiddenInfo")
      for (let eachRecordOfData of data) {
        if (!filterForPilots.includes(eachRecordOfData["PIL_SURNAME"])) {
          let objectForEachPilotRound = {
            key: eachRecordOfData["PIL_SURNAME"],
          }
          let values = []
          for (let eachRecordOfData2 of data) {
            if (eachRecordOfData["PIL_SURNAME"] === eachRecordOfData2["PIL_SURNAME"]) {
              values.push({
                x: eachRecordOfData2["RAC_ROUND"], y: eachRecordOfData2["RP_POINTS"]
              })
            }
          }
          values.sort((a, b) => a.x - b.x);
          filterForPilots.push(eachRecordOfData["PIL_SURNAME"])
          objectForEachPilotRound["values"] = values;
          graphArray.push(objectForEachPilotRound);
        }
      }
      graphArray.sort((a, b) => a["values"][0].x - b["values"][0].x);
      this.multiBarChart.setDataArray(graphArray);
    }
  }


}
