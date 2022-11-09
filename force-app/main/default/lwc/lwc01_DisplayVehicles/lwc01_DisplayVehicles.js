/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-04-2022   Chevish Boodhun   Initial Version
**/
import { api, LightningElement, track } from 'lwc';
import getRelatedVehicles from '@salesforce/apex/LWC01_DisplayVehiclesController.getRelatedVehicles'

export default class LwcDsiplayVehicles extends LightningElement {

    @api recordId;
    @track vehicles;

    connectedCallback() {
        this.getRelatedVehicles({ contactId: this.recordId }).then(res => this.vehicles = res);
    }

}