import { Component, OnInit, ViewChild } from '@angular/core';
import { OntimizeService } from 'ontimize-web-ngx';
import { ChartService, MultiBarChartConfiguration, OChartComponent } from 'ontimize-web-ngx-charts';

@Component({
  selector: 'app-pilots-points-chart',
  templateUrl: './pilots-points-chart.component.html',
  styleUrls: ['./pilots-points-chart.component.scss']
})
export class PilotsPointsChartComponent implements OnInit {

  @ViewChild('barChart', { static: true }) barChart: OChartComponent;

  barChartConfig: MultiBarChartConfiguration;

  constructor(protected service: OntimizeService) {

  }

  ngOnInit() {
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('results');
    this.service.configureService(conf);
  }

  ngAfterViewInit(): void {
    if (this.barChart) {
      let chartService: ChartService = this.barChart.getChartService();
      let chartOps = chartService.getChartOptions();
      chartOps["yDomain"] = [-50, 102];
    }
  }

  loadPointsPerRoundChart(arrayCombo: Array<any>) {
    this.configureService()

    let graphArray: Array<Object> = [];
    let filterForPilots: Array<String> = [];
    for (let pilotId of arrayCombo) {
      this.service.query({ "PIL_ID": pilotId },
        ["PIL_SURNAME", "RES_POINTS", "RAC_ROUND"], "roundClasification").subscribe(resp => {
          resp.data.sort((a, b) => a["RAC_ROUND"] + b["RAC_ROUND"]);

          for (let eachRecordOfData of resp.data) {
            if (!filterForPilots.includes(eachRecordOfData["PIL_SURNAME"])) {
              let objectForEachPilotRound = {
                key: eachRecordOfData["PIL_SURNAME"],
              }
              let values = []
              for (let eachRecordOfData2 of resp.data) {
                if (eachRecordOfData["PIL_SURNAME"] === eachRecordOfData2["PIL_SURNAME"]) {
                  values.push({
                    x: eachRecordOfData2["RAC_ROUND"], y: eachRecordOfData2["RES_POINTS"]
                  })
                }
              }
              values.sort((a, b) => a.x - b.x);
              filterForPilots.push(eachRecordOfData["PIL_SURNAME"])
              objectForEachPilotRound["values"] = values;
              graphArray.push(objectForEachPilotRound);
              console.log({ graphArray });
            }
          }
        });
      this.barChart.setDataArray(graphArray);
    }
  }

}
