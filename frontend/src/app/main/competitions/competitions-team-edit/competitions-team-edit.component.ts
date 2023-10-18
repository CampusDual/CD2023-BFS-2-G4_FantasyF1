import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-competitions-team-edit',
  templateUrl: './competitions-team-edit.component.html',
  styleUrls: ['./competitions-team-edit.component.scss']
})
export class CompetitionsTeamEditComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  loadData(data){
    console.log(data);
    
  }

}
