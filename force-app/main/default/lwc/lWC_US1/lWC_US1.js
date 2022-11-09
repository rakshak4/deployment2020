/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 03/11/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   03/11/2022   Narmeen Nehor   Initial Version
**/
import { LightningElement, api } from 'lwc';
import findVehicles from '@salesforce/apex/AP05_DisplayVehicles.findVehicles';

export default class LWC_US1 extends LightningElement {    
    @api recordId;
    @api vehicles;

    connectedCallback(){
        findVehicles({recordId:this.recordId}).then(result => {
            this.vehicles = result;
            console.log(this.vehicles)
            console.log(result +'<<<<<<Hii>>>>>>')
        }).catch(e => {console.log('Error:' +e);
    
        });
    }
}