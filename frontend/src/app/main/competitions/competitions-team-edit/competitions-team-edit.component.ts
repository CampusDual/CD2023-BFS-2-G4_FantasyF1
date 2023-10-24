import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-competitions-team-edit',
  templateUrl: './competitions-team-edit.component.html',
  styleUrls: ['./competitions-team-edit.component.scss']
})
export class CompetitionsTeamEditComponent implements OnInit {

  parentMessage = 0;

  constructor() { }

  ngOnInit() {
  }

  loadData(data){
    //console.log(data);
  }

  loadMoney(data){
    console.log(data.UC_AVAILABLE_MONEY);
    console.log(data.COMP_ID);
    console.log(data.UC_ID);
  }

}
