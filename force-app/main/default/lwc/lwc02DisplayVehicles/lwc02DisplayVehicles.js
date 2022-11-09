import { api, LightningElement } from 'lwc';
import getVehicles from  '@salesforce/apex/LWC02_GetContactVehicles.getVehicles';

export default class Lwc02DisplayVehicles extends LightningElement {
    @api recordId;

    vehicles;

    connectedCallback() {
        getVehicles({contactId: this.recordId}).then((result) => {
            this.vehicles = result;
            console.log(this.vehicles);
        }).catch((error) => {
            console.log('Error: ' + error);
        })
    }

}