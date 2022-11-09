/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-02-2022   Chevish Boodhun   Initial Version
**/
import { api, LightningElement, track } from 'lwc';
import getCaseVehicles from '@salesforce/apex/CaseVehicleDetailsController.getCaseVehicles'

export default class CaseVehicleDetails extends LightningElement {

    @api recordId
    @track result

    connectedCallback() {
        getCaseVehicles({caseId : this.recordId}).then(res => {this.result = res} )
    }

    removeLoanedVehicle() {
        getCaseVehicles({caseId : this.recordId}).then(res => {this.result = res} )
    }

    get DamagedVehicleId () {
        return this.result.DamagedVehicle__c
    }

    get LoanedVehicleId () {
        return this.result.LoanedVehicle__c
    }

    get loanEndDate () {
        if (this.result.LoanedVehicle__r) {
            return this.result.LoanedVehicle__r.LoanEndDate__c
        }
        return null
    }

}