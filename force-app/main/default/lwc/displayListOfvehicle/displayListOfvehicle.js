import { api, LightningElement } from 'lwc';
import getRelatedVehicles from '@salesforce/apex/AP11_GetRelatedVehiclesToContact.getRelatedVehicles';

export default class DisplayListOfvehicle extends LightningElement {

         
   @api recordId;
   @api vehiclesRelatedToContacts;

   connectedCallback(){

    //test 

    console.log('connected');
    console.log('record id', this.recordId);

    getRelatedVehicles({recordId:this.recordId}).then(result=>{
        this.vehiclesRelatedToContacts=result;
        console.log('loaned vehiucle',this.vehiclesRelatedToContacts);
    }).catch(e=>{console.log('error',e);})

  

}
   


}