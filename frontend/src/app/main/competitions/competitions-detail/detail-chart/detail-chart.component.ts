import { Component, OnInit, ViewChild } from '@angular/core';
import { OntimizeService } from 'ontimize-web-ngx';
import { LineChartConfiguration, OChartComponent } from 'ontimize-web-ngx-charts';

declare var d3: any;

@Component({
  selector: 'app-detail-chart',
  templateUrl: './detail-chart.component.html',
  styleUrls: ['./detail-chart.component.scss']
})
export class DetailChartComponent implements OnInit {

  @ViewChild('barChart', { static: true }) barChart: OChartComponent;
  @ViewChild('lineChart', { static: true }) lineChart: OChartComponent;

  public lineChartParametersSerie: LineChartConfiguration;

  constructor(
    protected service: OntimizeService,
    ) {
      this.lineChartParametersSerie = new LineChartConfiguration();
      this.lineChartParametersSerie.legend.vers = 'furious';
      this.lineChartParametersSerie.legendPosition = 'bottom';
      //this.lineChartParametersSerie.
    }

  ngOnInit() {
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('users_competitions');
    this.service.configureService(conf);
  }

  ngAfterViewInit() {
  }

}
