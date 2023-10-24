import { Injectable } from "@angular/core";

@Injectable({
    providedIn: "root",
})
export class CompetitionData {
    moneyUser: number;
    compID: number;
    ucID: number;

    constructor() { }

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
}