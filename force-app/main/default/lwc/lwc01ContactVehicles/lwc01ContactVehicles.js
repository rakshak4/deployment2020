/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Rayhaan Beeharry
**/
import { LightningElement,api } from 'lwc';
import getVehicles from '@salesforce/apex/LW01_ContactController.getVehicles';

export default class Lwc01ContactVehicles extends LightningElement {
    @api recordId
    @api vehicles=[]
    
    dataReady= false
    connectedCallback(){
        // console.log(this.recordId)
        getVehicles({contactId:this.recordId})
        .then(result =>{
            this.dataReady=true;
            console.log(JSON.stringify(result));
            this.vehicles=result;
        })
        .catch(error => {
            console.log(error);
        });
    }
}