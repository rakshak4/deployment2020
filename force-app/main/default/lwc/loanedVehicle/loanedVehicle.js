/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 06/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   05/11/2022   Akhilesh Ramchurn   Initial Version
 **/
import { LightningElement, api } from "lwc";
import getLoanedVehicleList from "@salesforce/apex/LWC02_RetrieveLoanedVehicle.getLoanedVehicleList";
export default class LoanedVehicle extends LightningElement {
    @api recordid;
    loanVeh;
    loanVehicleAvailable = false;

    //Dates
    today = new Date();
    endDate;
    diffDays;

    connectedCallback() {
        //console.log("recordId in child>>>>>.", this.recordid);
        getLoanedVehicleList({ recordId: this.recordid })
            .then((result) => {
                //console.log("loaned vehicle >>>>,", result);
                this.loanVeh = result[0];
                this.loanVehicleAvailable = true;

                // console.log("date from db >>>>,", result[0].LoanedVehicle__r.LoanEndDate__c);

                this.endDate = new Date(result[0].LoanedVehicle__r.LoanEndDate__c);
                //console.log("first test>>>", typeof this.today);
                //console.log("Second test>>>", typeof this.endDate);

                this.diffDays = Math.ceil((this.endDate - this.today) / (1000 * 60 * 60 * 24));
            })
            .catch((error) => {
                this.error = error;
            });
    }

    renderedCallback() {
        if (this.diffDays < 3) {
            //console.log("Diff>>>>>", this.diffDays);
            this.template.querySelector(".changeLoanColor").style = "background-color:red";
        }
    }
}