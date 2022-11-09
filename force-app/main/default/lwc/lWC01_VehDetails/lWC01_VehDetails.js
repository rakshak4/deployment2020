import { api, LightningElement } from 'lwc';
import getDetails from '@salesforce/apex/AP05_RetrieveVehDetails.getDetails';

export default class LWC01_VehDetails extends LightningElement {
    @api recordId;
    @api details;

connectedCallback(){
    getDetails({ caseID: this.recordId })
            .then((result) => {
                this.details = result[0];
                console.log(this.details);
            })
            .catch((error) => {
                this.error = error;
                this.details = undefined;
            });
}

}