/**
 * @description       :
 * @author            : Bhoovanyu Dhomah
 * @group             :
 * @last modified on  : 11-03-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-03-2022   Bhoovanyu Dhomah   Initial Version
 **/
import { LightningElement, api } from "lwc";

import getContacts from "@salesforce/apex/AP09_getAccCon.getContacts";
export default class Lwc02GetContacts extends LightningElement {
    @api recordId;
    @api contacts;

    // getContacts(recordId)

    connectedCallback() {
        console.log("connectedCallback");
        getContacts({ recordId: this.recordId })
            .then((result) => {
                this.contacts = result;
            })
            .catch((error) => {
                console.log(error);
            });
    }
}