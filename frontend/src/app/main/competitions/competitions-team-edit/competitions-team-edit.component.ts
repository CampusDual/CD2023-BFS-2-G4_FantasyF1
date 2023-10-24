import { Component, OnInit } from '@angular/core';
import { CompetitionData } from './competition-data.service';

@Component({
  selector: 'app-competitions-team-edit',
  templateUrl: './competitions-team-edit.component.html',
  styleUrls: ['./competitions-team-edit.component.scss']
})
export class CompetitionsTeamEditComponent implements OnInit {

  constructor(public parentService: CompetitionData) { }
  
  ngOnInit() {
  }

  loadData(data){
    console.log(data.UC_AVAILABLE_MONEY);
    console.log(data.COMP_ID);
    console.log(typeof data.UC_AVAILABLE_MONEY);
    console.log(typeof data.COMP_ID);
    this.parentService.setCompId(data.COMP_ID)
    this.parentService.setMoneyUser(data.UC_AVAILABLE_MONEY);
    console.log(this.parentService);
  }

}
