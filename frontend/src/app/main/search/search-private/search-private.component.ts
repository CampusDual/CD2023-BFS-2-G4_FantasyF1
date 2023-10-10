import { Component, ElementRef, Injector, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-search-private',
  templateUrl: './search-private.component.html',
  styleUrls: ['./search-private.component.css']
})
export class SearchPrivateComponent implements OnInit {

  protected service: OntimizeService;
  @ViewChild("privateComp", { static: true }) code: ElementRef;

  constructor(protected injector: Injector, private router: Router) {
    this.service = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    this.configureService();
  }

  onButtonClick() {
    this.router.navigate(['/main/search']);
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration('competitions');
    this.service.configureService(conf);
  }

  searchPrivate() {
    this.service.query({ "COMP_CODE": this.code.nativeElement.value, "COMP_ISPUBLIC": false }, ["COMP_ID"], "competition").subscribe(resp => {
      console.log(resp.data[0].COMP_ID);
      this.router.navigate(['/main/home/', resp.data[0].COMP_ID]);
    });
  }

}
