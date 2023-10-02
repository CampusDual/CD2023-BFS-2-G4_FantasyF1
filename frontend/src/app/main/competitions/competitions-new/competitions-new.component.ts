import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-new_competition',
  templateUrl: './competitions-new.component.html',
  styleUrls: ['./competitions-new.component.css']
})
export class CompetitionsNewComponent implements OnInit {

  public staticData = [{
    value: true,
    name: "PUBLIC"
  }, {
    value: false,
    name: "PRIVATE"
  }];


  constructor() { }

  ngOnInit() {
  }


}
