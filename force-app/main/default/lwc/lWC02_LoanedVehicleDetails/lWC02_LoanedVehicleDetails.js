import { LightningElement,api } from 'lwc';
import getLoanedVehDetails from '@salesforce/apex/lwcLoanedVehiclesController.getLoanedVehDetails';

export default class LWC02_LoanedVehicleDetails extends LightningElement {
    @api recordId;
    @api details;

connectedCallback(){
    getLoanedVehDetails({ caseID: this.recordId })
            .then((result) => {
                this.details = result;
                console.log(this.details);
            })
            .catch((error) => {
                this.error = error;
                this.details = undefined;
            });
}
}