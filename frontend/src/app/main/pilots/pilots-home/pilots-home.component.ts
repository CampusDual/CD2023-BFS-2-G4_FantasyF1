import { Component, OnInit, ViewChild } from '@angular/core';
import { OComboComponent, OntimizeService, SnackBarService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-pilots-home',
  templateUrl: './pilots-home.component.html',
  styleUrls: ['./pilots-home.component.css']
})
export class PilotsHomeComponent implements OnInit {

  @ViewChild('combo_filter', { static: true }) combo_filter: OComboComponent;

  constructor(protected service: OntimizeService,
    protected snackService: SnackBarService) { }

  ngOnInit() {
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('pilots_prices');
    this.service.configureService(conf);
  }

  arrayPilots: Array<any> = [
    {pilotId: 1,pilotSurname: 'Albon'}, {pilotId: 2,pilotSurname: 'Alonso'}, {pilotId: 3,pilotSurname: 'Bottas'}, 
    {pilotId: 4,pilotSurname: 'de Vries'},
    {pilotId: 5,pilotSurname: 'Gasly'}, {pilotId: 6,pilotSurname: 'Hamilton'}, {pilotId: 7,pilotSurname: 'Hülkenberg'},
    {pilotId: 8,pilotSurname: 'Lawson'}, {pilotId: 9,pilotSurname: 'Leclerc'}, {pilotId: 10,pilotSurname: 'Magnussen'},
    {pilotId: 11,pilotSurname: 'Norris'}, {pilotId: 12,pilotSurname: 'Ocon'}, {pilotId: 13,pilotSurname: 'Piastri'},
    {pilotId: 14,pilotSurname: 'Pérez'}, {pilotId: 15,pilotSurname: 'Ricciardo'}, {pilotId: 16,pilotSurname: 'Russell'},
    {pilotId: 17,pilotSurname: 'Sainz'}, {pilotId: 18,pilotSurname: 'Sargeant'}, {pilotId: 19,pilotSurname: 'Stroll'},
    {pilotId: 20,pilotSurname: 'Tsunoda'}, {pilotId: 21,pilotSurname: 'Verstappen'}, {pilotId: 22,pilotSurname: 'Zhou'},
  
    ];
  
    recogerDataCombo(){
  
      let priceVariationChart: Array<Object> = [];
      let pointsProgressionChart: Array<Object> = [];
  
      if (this.combo_filter.getValue().length === 0) {
        this.snackService.open("SELECCIONA PILOTOS DE LA LISTA PARA PODER FILTRAR (PONER LA TRADUCCIÓN)")
      } else{ 
        for(let pilotId of this.combo_filter.getValue()){
          this.service.query({ "PIL_ID": pilotId},
         ["PIL_SURNAME", "PP_PRICE", "RAC_ROUND"], "listNamePrice").subscribe(resp => {
          console.log(resp.data);
          let values = [];
          let eachPilotForGraph = {
            key: resp.data[0]["PIL_SURNAME"]
          }
          for(let i =0; i<resp.data.length; i++){
            values.push({
             x: resp.data[i]["RAC_ROUND"], y: resp.data[i]["PP_PRICE"]
            })
          }
          values.sort((a, b) => a.x - b.x);
          eachPilotForGraph['values']= values;
          priceVariationChart.push(eachPilotForGraph);
          console.log({priceVariationChart});
        });
        }
       
      } 
      
      
    }
  
    clearFilterPiltos(){
      this.combo_filter.clearValue();
    }
  

}
