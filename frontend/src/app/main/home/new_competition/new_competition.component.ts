import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-new_competition',
  templateUrl: './new_competition.component.html',
  styleUrls: ['./new_competition.component.css']
})
export class New_competitionComponent implements OnInit {

  public staticData = [{
    id: 1,
    name: "PUBLIC"
  }, {
    id: 2,
    name: "PRIVATE"
  }];


  constructor() { }

  ngOnInit() {
  }

}
