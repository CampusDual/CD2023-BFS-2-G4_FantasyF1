import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-competitions-results-history',
  templateUrl: './competitions-results-history.component.html',
  styleUrls: ['./competitions-results-history.component.css']
})
export class CompetitionsResultsHistoryComponent implements OnInit {

  username: String;

  constructor() { 
    
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

}
