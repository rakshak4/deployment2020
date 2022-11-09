/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-02-2022   Bhoovanyu Dhomah   Initial Version
**/
import { LightningElement, api } from 'lwc';
import getLoanedVeh from '@salesforce/apex/AP11_LoanedVehicleController.getLoanedVeh';
export default class LoanedVehicle extends LightningElement {
    @api recordId;
    @api classLoaned='';
    @api loanedVeh={};

    // @api loanedVeh = {Id:'a007S000002Z6LIQA0', make__c:'BMW2', LoanEndDate__c:'04/11/2022'};
    // @api loanedVeh 
    terminateLoan(){
        console.log('terminateLoan');
        const event = new CustomEvent('terminateLoan', {
            // detail contains only primitives
            detail: {loanedVeh: this.loanedVeh},
            bubbles: true,
            composed: true
        });
        console.log('terminateLoan');
        // Fire the event from c-tile
        this.dispatchEvent(event);
    }
    connectedCallback(){
        var today = new Date();
        
        getLoanedVeh({ recordId: this.recordId })
            .then((result) => {
                this.loanedVeh = result;
                console.log('loaned vehicle result '+ this.loanedVeh.LoanedVehicle__r.Model__c);
            })
            .catch((error) => {
                console.log(error);
            });

        if((this.loanedVeh.LoanedVehicle__r.LoanEndDate__c-this.today) <3){
            this.classLoaned='classRed';
        }
    }




}