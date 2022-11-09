/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 04/11/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   04/11/2022   Narmeen Nehor   Initial Version
**/
import { LightningElement, api } from 'lwc';
import methodName from '@salesforce/apex/AP06_GetListOfVehicles.retrieveVehicles';

export default class LW01_Quiz extends LightningElement {

    @api recordId;
    @api vehicles;

    connectedCallback(){
        this.recordId = recordId;

        retrieveContactData({recordId:this.recordId}).then(result => {
            (this.recordId)
        }).catch(e => {
            console.log('error', e);
        })
        
    }
    
}