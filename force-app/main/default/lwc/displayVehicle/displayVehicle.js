/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-04-2022   Bhavish Nundoo   Initial Version
**/
import { LightningElement,api } from 'lwc';
//import labelName from '@salesforce/label/ListOfVehicles';
import getVehicle from '@salesforce/apex/AP01_displayListOfVehicle.getVehicle';

export default class DisplayVehicle extends LightningElement {
    @api recordId
    @api vehicles

    connectedCallback(){
       
        getVehicle({recordId:this.recordId}).then((result) => {
            this.vehicles = result;
       }).catch(e => {console.log(e);
        })

 }
}