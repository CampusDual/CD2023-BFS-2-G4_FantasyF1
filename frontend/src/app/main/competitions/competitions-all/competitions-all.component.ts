import { Component, ElementRef, Injector, OnInit, ViewChild } from '@angular/core';
import { OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-competitions-all',
  templateUrl: './competitions-all.component.html',
  styleUrls: ['./competitions-all.component.css']
})
export class CompetitionsAllComponent implements OnInit {

  protected service: OntimizeService;
  @ViewChild("informacion", { static: true }) codigo: ElementRef;

  constructor(protected injector: Injector) {

    this.service = this.injector.get(OntimizeService);

  }

  ngOnInit() {

    this.configureService();

  }

  protected configureService() {

    // Configure the service using the configuration defined in the `app.services.config.ts` file

    const conf = this.service.getDefaultServiceConfiguration('competitions');

    this.service.configureService(conf);

  }

  searchPrivate2() {

    console.log(this.codigo.nativeElement.value);

    this.service.query({ "COMP_CODE": this.codigo.nativeElement.value }, ["COMP_ID", "COMP_NAME"], "competition").subscribe(resp => {

      console.log(resp);

    })

  }

}
