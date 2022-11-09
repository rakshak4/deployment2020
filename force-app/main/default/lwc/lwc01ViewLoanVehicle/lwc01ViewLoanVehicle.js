import { api, LightningElement } from 'lwc';
import updateVehicle from  '@salesforce/apex/LWC02_TerminateVehicleLoan.updateVehicle';
import updateCase from  '@salesforce/apex/LWC02_TerminateVehicleLoan.updateCase';

export default class Lwc01ViewLoanVehicle extends LightningElement {
    @api loanVehId;
    @api caseId;
    @api disableButton;

    handleTermination() {
    
        //let newDate = new Date().toISOString().slice(0,10);
        let vehObj = {Id: this.loanVehId, LoanEndDate__c: null, LoanStartDate__c: null, status__c: 'available'};
        updateVehicle({vehToUpdate : vehObj}).then(() => {
            let casObj = {Id: this.caseId, LoanedVehicle__c: null};
            updateCase({casToUpdate: casObj}).then(() => {
                const event = new CustomEvent('terminateloan', {
                    // detail contains only primitives
                    bubbles:true,
                    composed: true
                });
                // Fire the event from c-tile
                this.dispatchEvent(event);
            })
        })
    }

}