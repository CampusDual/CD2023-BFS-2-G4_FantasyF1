import { Component, OnInit } from '@angular/core';
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

  isEditable:boolean = false;

  showButton(data){

    for(let element of data){
      if (element.USER_ === this.serviceLoginService.getUserName() ){
        this.isEditable=true ;
      }
    }

  }



}
