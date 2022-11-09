/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-06-2022
 * @last modified by  : Rayhaan Beeharry
**/
import { LightningElement, api} from 'lwc';
import getCustomerVehicle from '@salesforce/apex/LWC01_CustomerVehicleController.getCustomerVehicle';

export default class Lwc01CustomerVehicle extends LightningElement {
    @api recordId

    customerVehicle
    dataReady= false
    connectedCallback(){
        getCustomerVehicle({id:this.recordId})
        .then(result =>{
            this.dataReady=true;
            this.customerVehicle= result[0].CustomerVehicle__r;
        })
        .catch(error => {
            console.log(error);
        });
    }
}