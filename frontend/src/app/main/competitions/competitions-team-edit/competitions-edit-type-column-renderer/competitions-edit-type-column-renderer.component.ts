import { Component, Injector, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer } from 'ontimize-web-ngx';

@Component({
  selector: 'app-competitions-edit-type-column-renderer',
  templateUrl: './competitions-edit-type-column-renderer.component.html',
  styleUrls: ['./competitions-edit-type-column-renderer.component.css']
})
export class CompetitionsEditTypeColumnRendererComponent extends OBaseTableCellRenderer {

  @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;

  constructor(protected injector: Injector) {
    super(injector);
  }

  ngOnInit() {
  }

  buyDriver(){
    alert("Holi");
  }

}
