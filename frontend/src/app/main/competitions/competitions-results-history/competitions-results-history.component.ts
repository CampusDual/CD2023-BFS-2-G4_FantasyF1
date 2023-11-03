import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-competitions-results-history',
  templateUrl: './competitions-results-history.component.html',
  styleUrls: ['./competitions-results-history.component.css']
})
export class CompetitionsResultsHistoryComponent implements OnInit {

  username: String;

  constructor() { }

  ngOnInit() {
  }

  loadDataTable(data) {
    this.username = data[0].USER_;
  }

}
