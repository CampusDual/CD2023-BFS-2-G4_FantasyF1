import { EventEmitter, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LoginFormService {

constructor() { }

$modal = new EventEmitter<any>();

}
