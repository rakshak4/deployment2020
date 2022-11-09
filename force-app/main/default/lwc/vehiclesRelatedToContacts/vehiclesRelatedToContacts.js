/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-04-2022   Kanigan Somadoo   Initial Version
**/
import { LightningElement, api } from 'lwc';
import  getVehiclesRelatedToContact from '@salesforce/apex/LWC03_VehiclesRelatedToContactController.getVehiclesRelatedToContact';


export default class VehiclesRelatedToContacts extends LightningElement {

    @api recordId
    vehicles = [];

    connectedCallback(){

        console.log(this.recordId)
        getVehiclesRelatedToContact({conId : this.recordId})
        .then(result => {
            this.vehicles = result;
            console.log(this.vehicle);
        })
        .catch(error => {
            console.log(error);
        })
    }





    
}