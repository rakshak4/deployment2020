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
import { api, LightningElement } from 'lwc';
import getRelatedVehicles from '@salesforce/apex/LWC01_DisplayVehiclesController.getRelatedVehicles'
import labelName from '@salesforce/label/c.ContactVehicles';

export default class LwcDsiplayVehicles extends LightningElement {

    @api recordId;
    vehicles;
    label = labelName;

    connectedCallback() {
        getRelatedVehicles({ contactId: this.recordId }).then(res => {
            this.vehicles = res
            console.log(res)
        });
    }

}