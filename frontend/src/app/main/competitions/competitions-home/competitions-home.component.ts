import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { CompetitionsNewComponent } from '../competitions-new/competitions-new.component';

/**
 * @title Dialog elements
 */

@Component({
  selector: 'app-competitions-home',
  templateUrl: './competitions-home.component.html',
  styleUrls: ['./competitions-home.component.css']
})
export class CompetitionsHomeComponent implements OnInit {

  username: string; 

  constructor(private router: Router, public dialog: MatDialog) {
   }

  ngOnInit() {
  }

  // newLeagueRoute(){
  //   this.router.navigate(['/main/home/new']);
  //   const url = `/main/home/new?isdetail=true`;
  //   this.router.navigateByUrl(url);
  // }

  openDialog() {
    this.dialog.open(CompetitionsNewComponent);
  }

}
