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
    this.parentService.setCompId(data.COMP_ID)
    this.parentService.setMoneyUser(data.UC_AVAILABLE_MONEY);
    this.parentService.setUcId(data.UC_ID);
    console.log(this.parentService);
  }

}
