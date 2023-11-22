import { Component, OnInit, ViewChild } from '@angular/core';
import { OComboComponent, OFormComponent, OTranslateService, SnackBarService } from 'ontimize-web-ngx';
import { PilotsPriceChartComponent } from '../pilots-price-chart/pilots-price-chart.component';
import { PilotsPointsChartComponent } from '../pilots-points-chart/pilots-points-chart.component';

@Component({
  selector: 'app-pilots-home',
  templateUrl: './pilots-home.component.html',
  styleUrls: ['./pilots-home.component.css']
})
export class PilotsHomeComponent implements OnInit {

  @ViewChild('combo_filter', { static: true }) combo_filter: OComboComponent;
  @ViewChild("form_component", { static: true }) form_component: OFormComponent;
  @ViewChild('chartPrice', { static: true }) chartPrice: PilotsPriceChartComponent;
  @ViewChild('chartPoints', { static: true }) chartPoints: PilotsPointsChartComponent;

  arrayComboSelection: Array<Object> = [];

  arrayPilots: Array<any> = [
    { pilotId: 1, pilotSurname: 'Albon' }, { pilotId: 2, pilotSurname: 'Alonso' }, { pilotId: 3, pilotSurname: 'Bottas' },
    { pilotId: 5, pilotSurname: 'Gasly' }, { pilotId: 6, pilotSurname: 'Hamilton' }, { pilotId: 7, pilotSurname: 'Hülkenberg' },
    { pilotId: 9, pilotSurname: 'Leclerc' }, { pilotId: 10, pilotSurname: 'Magnussen' },
    { pilotId: 11, pilotSurname: 'Norris' }, { pilotId: 12, pilotSurname: 'Ocon' }, { pilotId: 14, pilotSurname: 'Piastri' },
    { pilotId: 13, pilotSurname: 'Pérez' }, { pilotId: 16, pilotSurname: 'Russell' },
    { pilotId: 17, pilotSurname: 'Sainz' }, { pilotId: 18, pilotSurname: 'Sargeant' }, { pilotId: 19, pilotSurname: 'Stroll' },
    { pilotId: 20, pilotSurname: 'Tsunoda' }, { pilotId: 21, pilotSurname: 'Verstappen' }, { pilotId: 22, pilotSurname: 'Zhou' },
  ];

  constructor(protected snackService: SnackBarService, private translator: OTranslateService) {
  }

  ngOnInit() {
  }

  loadInfoChartsFromCombo() {
    if (this.combo_filter.getValue().length===0) {
      document.getElementById("infoNoData").classList.remove("hiddenInfo")
      this.snackService.open(this.translator.get('PICK_PILOTS_MESSAGE'))
    } else{
      document.getElementById("infoNoData").classList.add("hiddenInfo")
      document.getElementById("chartPrice").classList.remove("hiddenInfo")
      document.getElementById("chartPoints").classList.remove("hiddenInfo")
      this.chartPrice.loadPricePerRoundChart(this.combo_filter.getValue())
      this.chartPoints.loadPointsPerRoundChart(this.combo_filter.getValue())
    }
  }

  clearFilterPiltos() {
    this.combo_filter.clearValue();
  }


}
