/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 03/11/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   02/11/2022   Mehreen Jhummun   Initial Version
**/
import { api, wire, LightningElement } from 'lwc';
import displayDetailsLoan from '@salesforce/apex/AP01_SelectDetailLoan.displayDetailsLoan';

export default class Lwc01LoanedVehicle extends LightningElement {
    @api recordId;
    connectedCallback(){
        console.log(this.recordId);
    }

    @wire(displayDetailsLoan,{caseid:'$recordId'})
    vehicledetailloan;

    
}