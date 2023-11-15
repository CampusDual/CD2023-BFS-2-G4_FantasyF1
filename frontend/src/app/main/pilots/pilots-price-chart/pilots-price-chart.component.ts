import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { OTranslateService, OntimizeService, SnackBarService } from 'ontimize-web-ngx';
import { ChartService, LineChartConfiguration, OChartComponent } from 'ontimize-web-ngx-charts';


@Component({
  selector: 'app-pilots-price-chart',
  templateUrl: './pilots-price-chart.component.html',
  styleUrls: ['./pilots-price-chart.component.scss']
})
export class PilotsPriceChartComponent implements OnInit {

  @ViewChild('lineChart', { static: true }) lineChart: OChartComponent;
  lineChartParametersSerie: LineChartConfiguration;

  constructor(protected service: OntimizeService,protected snackService: SnackBarService, private translator: OTranslateService
   ) {
    this.lineChartParametersSerie = new LineChartConfiguration();
    this.lineChartParametersSerie.legend.vers = 'furious';
    this.lineChartParametersSerie.legendPosition = 'bottom';
    this.lineChartParametersSerie.showLegend = true;
    this.lineChartParametersSerie.x1Axis.axisLabel=this.translator.get('LINE_CHART_XAXIS');
    this.lineChartParametersSerie.y1Axis.axisLabel=this.translator.get('LINE_CHART_PRICES_YAXIS');
   }

  ngOnInit() {
    this.configureService();
  }

  ngAfterViewInit(): void {
    if (this.lineChart) {
      let chartService: ChartService = this.lineChart.getChartService();
      let chartOps = chartService.getChartOptions();
      chartOps["yDomain"] = [-10000, 130000];
    }
  }
  
  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('pilots_prices');
    this.service.configureService(conf);
  }
  
  loadPricePerRoundChart(arrayCombo: Array<any>){

    this.configureService()
  
    let priceVariationChart: Array<Object> = [];
      for(let pilotId of arrayCombo){
        this.service.query({ "PIL_ID": pilotId},
       ["PIL_SURNAME", "PP_PRICE", "RAC_ROUND"], "listNamePrice").subscribe(resp => {
        let values = [];
        let eachPilotForGraph = {
          key: resp.data[0]["PIL_SURNAME"]
        }
        for(let i =0; i<resp.data.length; i++){
          if(resp.data[i]["RAC_ROUND"]===undefined){
            values.push({
              x: 0, y: resp.data[i]["PP_PRICE"]
             })
          } else{
            values.push({
              x: resp.data[i]["RAC_ROUND"], y: resp.data[i]["PP_PRICE"]
             })
          }
        }
        values.sort((a, b) => a.x - b.x);
        eachPilotForGraph['values']= values;
        priceVariationChart.push(eachPilotForGraph);
      });
      }
      this.lineChart.setDataArray(priceVariationChart);
      this.lineChart.reloadData();
  }
}
