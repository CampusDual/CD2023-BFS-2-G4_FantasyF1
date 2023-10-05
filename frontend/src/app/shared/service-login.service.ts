import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ServiceLoginService {

private user_: string = '';

constructor() { }

setUser_(username: string) {
  this.user_ = username;
}

getUserName(): string {
  return this.user_;
}

}
