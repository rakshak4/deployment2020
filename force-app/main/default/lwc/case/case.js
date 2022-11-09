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
import getVehicle from '@salesforce/apex/AP01_getVehicleRecord.getVehicle';

export default class Case extends LightningElement {
    @api recordId
     @api cases;

     connectedCallback(){
        
         getVehicle({recordId:this.recordId}).then((result) => {
             this.cases = result;
        }).catch(e => {console.log(e);
         })

     }
  
    
}

// @wire(getVehicle) wiredVehicle({data,error}){
//     if (data) {
//         console.log(data); 
//         } else if (error) {
//         console.log(error);
//         }

// }