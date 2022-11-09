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
import getCustomerVeh from '@salesforce/apex/AP10_customerVehicleController.getCustomerVeh';
export default class CustomerVehicle extends LightningElement {
    @api customerveh={}
    @api recordId

    connectedCallback() {
        // this.recordId= recordId;
        // console.log(this.recordId);
        getCustomerVeh({ recordId: this.recordId })
            .then((result) => {
                this.customerveh = result;
                console.log('customer vehicle result '+ this.customerveh.DamagedVehicle__r.Model__c);
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
    // @api customerVeh = {Id:'a007S000003Gfw7QAC', make__c:'BMW'};
}