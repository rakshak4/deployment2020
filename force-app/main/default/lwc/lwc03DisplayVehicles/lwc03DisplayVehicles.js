import { LightningElement,api } from 'lwc';
import queryVehicles from '@salesforce/apex/LWC03_DisplayVehicles.queryVehicles';
import VehicleTitle from '@salesforce/label/c.VehicleTitle';

export default class Lwc03_DisplayVehicles extends LightningElement {
    @api recordId;
    lstVehicles = [];
    label = {
        VehicleTitle
    };

    connectedCallback(){
        queryVehicles({contactId: this.recordId})
        .then(result => {
            this.lstVehicles = result;

        })
        .catch(error => {
            this.showErrorToast(error, 'queryVehicles', 'error', 'sticky');
        });
    }

}