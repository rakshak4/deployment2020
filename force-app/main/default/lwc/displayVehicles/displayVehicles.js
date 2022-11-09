/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 05/11/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   05/11/2022   Narmeen Nehor   Initial Version
**/
import { LightningElement, api, track } from 'lwc';
import getVehicles from  '@salesforce/apex/AP06_GetListOfVehicles.getVehicles';

export default class DisplayVehicles extends LightningElement {
    @api recordId
    @track vehicledetails

    connectedCallback() {
        getVehicles({caseId: this.recordId})
            .then(result => {

                this.vehicledetails = result;

            })
            .catch(error => {
                this.error = error;
                console.log('>>>',error)
            });

    }
}