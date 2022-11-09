/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-03-2022   Kanigan Somadoo   Initial Version
**/
import { LightningElement, api} from 'lwc';
import getCasRelLoanVehicle from '@salesforce/apex/LWC02_CaseRelatedLoanVehicle.getCasRelLoanVehicle';

export default class CaseRelatedLoanVehicle extends LightningElement {

   
    @api recordId // pass from parent to child
    loanvehicle = {};

    connectedCallback(){
        getCasRelLoanVehicle({caseId : this.recordId})
        .then(result =>{
            this.loanvehicle = result;
        })
        .catch(error=> {
            console.log(error);
        } )

    }




    
}