/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-02-2022   Bhoovanyu Dhomah   Initial Version
**/
import { LightningElement, api, wire } from 'lwc';
import getVehicles from '@salesforce/apex/AP10_customerVehicleController.getCustomerVeh';
export default class Lwc01ShowVehicleDetails extends LightningElement {
    @api recordId;
    @api vehicles;
    @api customerVeh;
    @api LoanedVeh;
    
    
    connectedCallback() {
        // this.recordId= recordId;
        // console.log(this.recordId);
        getVehicles({ recordId: this.recordId })
            .then((result) => {
                this.vehicles = result;
                this.customerVeh = this.vehicles[0];
                this.LoanedVeh = this.vehicles[1];
                console.log('ShowVehicleDetails result '+ this.vehicles);
            })
            .catch((error) => {
                console.log(error);
            });

        // console.log('in parent 1 '+this.vehicles);
        

        // console.log('in parent '+this.vehicles[0].Model__c);

        

        console.log('connectedCallback');
        // this.recordId = this.recordId;
        window.addEventListener('terminateLoan', this.handleVehicle);

    }

    // @api contacttoshow
    handleVehicle = (event) =>{
        console.log('listener');
        console.log('>>'+ event.detail.loanedVeh.Id);
        // this.contact=event.detail.loanedVeh
    }

    

    
}