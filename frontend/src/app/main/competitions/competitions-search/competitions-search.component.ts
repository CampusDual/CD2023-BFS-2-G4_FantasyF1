import { Component, ElementRef, Injector, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';
import { MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-competitions-search',
  templateUrl: './competitions-search.component.html',
  styleUrls: ['./competitions-search.component.scss']
})
export class CompetitionsSearchComponent implements OnInit {

  protected service: OntimizeService;
  @ViewChild('privateComp', { static: true }) privateComp: OTextInputComponent;

  constructor(protected injector: Injector, private router: Router, public dialogRef: MatDialogRef<CompetitionsSearchComponent>) {
    this.service = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    this.configureService();
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('competitions');
    this.service.configureService(conf);
  }

  searchPrivate() {
    const code = this.privateComp.getValue();

    this.service.query({ "COMP_CODE": code, "COMP_ISPUBLIC": false },
      ["COMP_ID"], "competition").subscribe(resp => {
        const competitionId = resp.data[0].COMP_ID;
        const url = `/main/home/${competitionId}?isdetail=true`;
        this.router.navigateByUrl(url);
        this.dialogRef.close();
      });
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
