import { LightningElement,api } from 'lwc';
import queryVehicles from '@salesforce/apex/LWC03_DisplayVehicles.queryVehicles';

export default class Lwc03_DisplayVehicles extends LightningElement {
    @api recordId;

    lstVehicles = [];

    connectedCallback(){
        console.log('>>recordid: ',this.recordId);
        queryVehicles({contactId: this.recordId})
        .then(result => {
            this.lstVehicles = result;

        })
        .catch(error => {
            this.showErrorToast(error, 'queryVehicles', 'error', 'sticky');
        });
    }

}