/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 05/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   04/11/2022   Akhilesh Ramchurn   Initial Version
 **/
import { api, LightningElement } from "lwc";

export default class VehicleItem extends LightningElement {
    @api vehicle;
    colour;
    // connectedCallback() {
    //     console.log("vehicle >> ", this.vehicle);
    // }

    // renderedCallback() {
    //     // console.log("Vehicle ID >>>>>", this.vehicle.Id);
    //     //this.template.querySelector("a007S0000036aARQAY").classList.remove("blue-icon");
    //     // this.template.querySelector("a007S0000036aARQAY").classList.add("green-icon");

    //     console.log(">>>>", this.template.querySelector('[data-id="overview"]').className);
    //     this.template.querySelector('[data-id="overview"]').className = "green-icon";
    //     // this.template.querySelector("h1").className = "green-icon";
    // }

    connectedCallback() {
        this.colour = "background-color:" + this.vehicle.Colour__c;
    }
}