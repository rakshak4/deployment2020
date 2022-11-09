/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-05-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-04-2022   Bhoovanyu Dhomah   Initial Version
**/

import { LightningElement, api } from 'lwc';
import getContactVeh from '@salesforce/apex/AP12_DisplayVehicles.getContactVeh';

export default class Lwc03_DisplayVehicles extends LightningElement {
    @api recordId;
    @api vehicles=[];

    @api vehicles2=[{Id:1,make__c:'BMW2'},{Id:2, make__c:'BMW3'}];
    connectedCallback(){
        getContactVeh({ recordId: this.recordId })
            .then((result) => {
                this.vehicles = result;
                console.log(this.vehicles);
                // console.log('loaned vehicle result '+ this.result);
            })
            .catch((error) => {
                console.log(error);
            });
    }
    
}