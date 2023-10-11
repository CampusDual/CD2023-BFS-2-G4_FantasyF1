import { Component, OnInit, ViewChild } from '@angular/core';
import { OTextInputComponent } from 'ontimize-web-ngx';
import { ServiceLoginService } from 'src/app/shared/service-login.service';

@Component({
  selector: 'app-competitions-detail',
  templateUrl: './competitions-detail.component.html',
  styleUrls: ['./competitions-detail.component.scss']
})
export class CompetitionsDetailComponent implements OnInit {

  constructor(private serviceLoginService : ServiceLoginService) { }

  ngOnInit() {
  }

  @ViewChild("code_panel", { static: true }) code_panel: OTextInputComponent;

  isEditable:boolean = false;

  isPrivate:boolean = true;

  showButton(data){

    for(let element of data){
      if (element.USER_ === this.serviceLoginService.getUserName() ){
        this.isEditable=true ;
      }
    }
  }

  showPanelCode(data){
    
    if (data.COMP_CODE === "") {
      this.isPrivate=false
    } 
  }



}
