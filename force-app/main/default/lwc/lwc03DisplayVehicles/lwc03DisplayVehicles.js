import { LightningElement, api} from 'lwc';
import getVehicleList from '@salesforce/apex/LWC03_DisplayVehicles.getVehicleList';

export default class LWC03_DisplayVehicles extends LightningElement {
    @api recordId;
    @api vehicles;

    connectedCallback(){
        getVehicleList({ contactId: this.recordId })
                .then((result) => {
                    this.vehicles = result;
                })
                .catch((error) => {
                    this.error = error;
                    this.vehicles = undefined;
                });
    }
        

    
}