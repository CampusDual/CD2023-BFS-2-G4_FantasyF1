import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-new_competition',
  templateUrl: './competitions-new.component.html',
  styleUrls: ['./competitions-new.component.css']
})
export class CompetitionsNewComponent implements OnInit {

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
