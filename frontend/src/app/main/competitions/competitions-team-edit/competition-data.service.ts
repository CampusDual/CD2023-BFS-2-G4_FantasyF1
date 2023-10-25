import { Injectable } from "@angular/core";
import { Subject } from "rxjs";

@Injectable({
    providedIn: "root",
})
export class CompetitionData {
    moneyUser: number;
    compID: number;
    ucID: number;
    count_pilots_user: number=0;

    private dataUpdated = new Subject<void>();
    dataUpdated$ = this.dataUpdated.asObservable();
 
    constructor() { }
  
    triggerDataUpdate() {
      this.dataUpdated.next();
    }


    setMoneyUser(money: number) {
        this.moneyUser = money;
    }

    getMoneyUser() {
        return this.moneyUser;
    }

    setCompId(id: number) {
        this.compID = id;
    }

    getCompId() {
        return this.compID;
    }

    setUcId(id: number) {
        this.ucID = id;
    }

    getUcId() {
        return this.ucID;
    }

    setPilotsUserCount(users_count: number){
        this.count_pilots_user=users_count;
    }

    getPilotsUserCount(){
        return this.count_pilots_user;
    }

}