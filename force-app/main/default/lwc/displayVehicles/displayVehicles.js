/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 05/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   04/11/2022   Akhilesh Ramchurn   Initial Version
 **/
import { LightningElement, api, track } from "lwc";
import getcontactVehicleList from "@salesforce/apex/LWC02_RetrieveVehicleContact.getcontactVehicleList";

export default class DisplayVehicles extends LightningElement {
    @track vehList;
    @api recordId;

    connectedCallback() {
        console.log(this.recordId);
        getcontactVehicleList({ recordId: this.recordId })
            .then((result) => {
                this.vehList = result;
                console.log(result);
            })
            .catch((error) => {
                this.error = error;
            });
    }
}