import { Component, Injector, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer } from 'ontimize-web-ngx';

@Component({
  selector: 'app-competitions-detail-renderer',
  templateUrl: './competitions-detail-renderer.component.html',
  styleUrls: ['./competitions-detail-renderer.component.css']
})
export class CompetitionsDetailRendererComponent extends OBaseTableCellRenderer implements OnInit {

  username: string = "";
  @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;

  constructor(protected injector: Injector) {
    super(injector);
  }

  ngOnInit() {
    let sessionData = localStorage.getItem("com.ontimize.web.ngx.jee.seed");
    this.username = JSON.parse(sessionData).session["user"];
  }

}
