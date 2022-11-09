/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 05/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   03/11/2022   Akhilesh Ramchurn   Initial Version
 **/
import { LightningElement, api, track } from "lwc";
import getCustomerVehicleList from "@salesforce/apex/LWC01_RetrieveCustomerVehicle.getCustomerVehicleList";
export default class CustomerVehicle extends LightningElement {
    @track cusVeh;
    @api recordId;
    customerVehicleAvailable = false;
    connectedCallback() {
        //  console.log(this.recordId);
        getCustomerVehicleList({ recordId: this.recordId })
            .then((result) => {
                // console.log("Whole object list>>>>>", result);
                console.log("First object>>>>", result[0]);
                this.cusVeh = result[0];
                this.customerVehicleAvailable = true;
            })
            .catch((error) => {
                this.error = error;
            });
    }
}