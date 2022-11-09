/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-03-2022   Ayman Rummun   Initial Version
**/
import { LightningElement, api } from 'lwc';
import getLoanedVehicleDetails from '@salesforce/apex/LWC02_GetLoanedVehicle.getLoanedVehicleDetails';

export default class Loanedvehicle extends LightningElement {
    @api cid;
    @api loanedvehicles =[];

    connectedCallback()
    {
        console.log('recordId', this.cid);
        getLoanedVehicleDetails({recordId: this.cid}).then((response) => {
            this.loanedvehicles = response;
            console.log('loan vehicle: ', this.loanedvehicles);
        }).catch((error) =>{
            console.log('Error: ', error.body.message);
        });
    }

}