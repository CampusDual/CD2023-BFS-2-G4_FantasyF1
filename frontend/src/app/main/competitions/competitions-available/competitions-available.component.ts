import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { CompetitionsSearchComponent } from '../competitions-search/competitions-search.component';

@Component({
  selector: 'app-competitions-available',
  templateUrl: './competitions-available.component.html',
  styleUrls: ['./competitions-available.component.scss']
})
export class CompetitionsAvailableComponent implements OnInit {

  constructor(public dialog: MatDialog) { }

  ngOnInit() {
  }

  // searchPrivateRoute(){
  //   this.router.navigate(['/main/competitions/search']);
  //   const url = `/main/competitions/search?isdetail=true`;
  //   this.router.navigateByUrl(url);
  // }

  openDialog() {
    this.dialog.open(CompetitionsSearchComponent);
  }

}
