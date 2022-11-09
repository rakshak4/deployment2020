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
import { api, LightningElement } from 'lwc';
import removeLoanedVehicle from '@salesforce/apex/LoanedVehicleDetailsController.removeLoanedVehicle';

export default class LoanedVehicleDetails extends LightningElement {

    @api caseId
    @api vehicleId
    @api loanEndDate

    dateDifferenceFromNow(endDate) {
        const diffTime = Math.abs(new Date(endDate) - new Date())
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
        return diffDays
    }

    get className() {
        return this.dateDifferenceFromNow(this.loanEndDate) < 3 ? 'red-detail-box' : ''
    }

    get disableBtn() {
        return this.vehicleId ? false : true
    }

    handleTerminate() {
        removeLoanedVehicle({
            caseId : this.caseId, vehicleId: this.vehicleId
        }).then(() => {
            const event = new CustomEvent('removeloanedvehicle', {
                bubbles: true
            })
            this.dispatchEvent(event)
        }).catch(error =>
            console.log(error)
        )
    }

}