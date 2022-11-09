import { api, LightningElement } from 'lwc';
import getCaseDetail from  '@salesforce/apex/LWC01_RetrieveVehicles.getCaseDetail';


export default class Lwc01ViewVehiclesDetails extends LightningElement {
    @api recordId;

    data;
    error;
    background ='';
    disabledButton = true;
    customerVehId;
    loanVehId;

    connectedCallback() {
        window.addEventListener('terminateloan', this.refreshPageDetails);

        getCaseDetail({caseId: this.recordId}).then((data) => {
            this.data  = data;
            this.error = undefined;

            if (data.LoanedVehicle__c !== undefined) {
                this.loanVehId = data.LoanedVehicle__c;
                this.disabledButton = false;

                let today = new Date().toISOString().slice(0,10);
                let date1 = new Date(data.LoanedVehicle__r.LoanEndDate__c);
                let date2 = new Date(today);

                let dateDiff=(date1.getTime()-date2.getTime())/1000;//difference in mili seconds
                dateDiff=dateDiff/(60*60*24);

                if (dateDiff < 3) {
                    this.background = 'redColor';
                }
            }
            if (data.CustomerVehicle__c !== undefined) {
                this.customerVehId = data.CustomerVehicle__c;
            }
        }).catch((error) => {
            this.error = error;
            this.data  = undefined;
            console.log('Error: ' + error);
        })
        
    }

    refreshPageDetails() {
        window.location.reload();
    }
}