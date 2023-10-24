import { Component, OnInit, ViewChild } from '@angular/core';
import { CompetitionData } from './competition-data.service';
import { OTableComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-competitions-team-edit',
  templateUrl: './competitions-team-edit.component.html',
  styleUrls: ['./competitions-team-edit.component.scss']
})
export class CompetitionsTeamEditComponent implements OnInit {

  @ViewChild('table_team_edit', {static:true}) table_team_edit: OTableComponent;

  constructor(public parentService: CompetitionData) { }
  
  ngOnInit() {
    this.parentService.dataUpdated$.subscribe(() => {
      this.reloadTable();
      });
  }

  reloadTable() {
    this.table_team_edit.reloadData(false);
    
  }

  loadData(data){
    this.parentService.setCompId(data.COMP_ID)
    this.parentService.setMoneyUser(data.UC_AVAILABLE_MONEY);
    this.parentService.setUcId(data.UC_ID);
   
  }

  loadTableData(data){
   
    let counter_pilots: number = 0;
    let sessionData = localStorage.getItem("com.ontimize.web.ngx.jee.seed");
    let username = JSON.parse(sessionData).session["user"];
    for(let user of data){
      if(user.USER_===username){
        counter_pilots++;
      }
    }
    this.parentService.setPilotsUserCount(counter_pilots);

  }

}
