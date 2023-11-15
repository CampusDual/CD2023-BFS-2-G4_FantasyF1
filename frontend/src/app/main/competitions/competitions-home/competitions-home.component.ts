import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { CompetitionsNewComponent } from '../competitions-new/competitions-new.component';

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

  openDialog() {
    this.dialog.open(CompetitionsNewComponent);
  }

}
