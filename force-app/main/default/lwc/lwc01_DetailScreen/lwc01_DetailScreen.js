import { api, LightningElement } from 'lwc';
import customerVehicle from '@salesforce/apex/LWC01_DetailScreen.customerVehicle';
import loanedVehicle from '@salesforce/apex/LWC01_DetailScreen.loanedVehicle';

export default class LWC01_DetailScreen extends LightningElement {
    @api recordId;
    hasLoan = false;
    disableButton = false
    variant = 'brand'
    custVehicle = {};
    loanVehicle = {};

    connectedCallback() {
        customerVehicle({ recordId: this.recordId}).then((result) => {
            this.custVehicle = result;
        }).catch((e) => {
            console.log('Error retrieving customer vehicle: ', e.body.message);
        })
        loanedVehicle({ recordId: this.recordId }).then((result) => {
            this.loanVehicle = result;
            this.hasLoan = true;
        }).catch((e) => {
            console.log('Error retrieving loaned vehicle: ', e.body.message);
        });
    }

    handleTerminate() {
        this.hasLoan = false;
        this.disableButton = true;
        this.variant = 'Neutral';
    }

    get loanStyle() {
        if (this.loanVehicle) {
            const endDate = new Date(this.loanVehicle.End_date__c);
            const today = new Date();
            let difference = endDate.getTime() - today.getTime();
            let days = Math.ceil(difference / (1000 * 3600 * 24));

            if (days < 3) {
                return 'background-color:red;'
            }
        }
        return;
    }
}