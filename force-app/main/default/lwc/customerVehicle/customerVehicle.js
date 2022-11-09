/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-03-2022   Bhavish Nundoo   Initial Version
**/
import { LightningElement, api } from 'lwc';
import getCustomerVehicle from '@salesforce/apex/AP01_customerVehicleController.getCustomerVehicle';

export default class CustomerVehicle extends LightningElement {
    @api recordId
     @api cases;

     connectedCallback(){
        
        getCustomerVehicle({recordId:this.recordId}).then((result) => {
             this.cases = result;
        }).catch(e => {console.log(e);
         })

     }
}