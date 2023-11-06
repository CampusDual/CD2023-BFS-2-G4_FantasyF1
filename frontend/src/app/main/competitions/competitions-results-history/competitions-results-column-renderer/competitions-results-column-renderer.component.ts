import { Component, Injector, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer } from 'ontimize-web-ngx';

@Component({
  selector: 'app-competitions-results-column-renderer',
  templateUrl: './competitions-results-column-renderer.component.html',
  styleUrls: ['./competitions-results-column-renderer.component.css']
})
export class CompetitionsResultsColumnRendererComponent extends OBaseTableCellRenderer implements OnInit {

  @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;

  constructor(protected injector: Injector) {
    super(injector);
  }

  ngOnInit() {
  }

}
