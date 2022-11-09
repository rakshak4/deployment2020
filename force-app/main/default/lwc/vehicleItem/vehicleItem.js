import { api, LightningElement } from 'lwc';
import getRelatedVehicles from '@salesforce/apex/AP11_GetRelatedVehiclesToContact.getRelatedVehicles';

export default class DisplayListOfvehicle extends LightningElement {

         
   @api vehicleId;
   @api vehiclesRelatedToContacts;

   connectedCallback(){

    //test 

    console.log('connected');
    console.log('record id', this.recordId);

    getRelatedVehicles({recordId:this.vehicleId}).then(result=>{
        this.vehiclesRelatedToContacts=result;
        console.log('vehicle...',this.vehiclesRelatedToContacts);
    }).catch(e=>{console.log('error',e);})

  

}
   


}