import { Component, OnInit } from '@angular/core';
import { ServiceLoginService } from 'src/app/shared/service-login.service';

@Component({
  selector: 'app-competitions-home',
  templateUrl: './competitions-home.component.html',
  styleUrls: ['./competitions-home.component.css']
})
export class CompetitionsHomeComponent implements OnInit {

  username: string; 

  constructor(private serviceLoginService : ServiceLoginService) {
    this.username= serviceLoginService.getUserName();
   }

  ngOnInit() {
  }

}
