import { LightningElement, api, wire } from 'lwc';
import getRelatedCustomerVehicles from '@salesforce/apex/LWC03_VehicleController2.getRelatedCustomerVehicles';

import MAKE_FIELD from '@salesforce/schema/Vehicle__c.Make__c';
import MODEL_FIELD from '@salesforce/schema/Vehicle__c.Model__c';

const COLUMNS = [
    { label: 'Vehicle Make', fieldName: MAKE_FIELD.fieldApiName, type: 'text' },
    { label: 'Vehicle Model', fieldName: MODEL_FIELD.fieldApiName, type: 'text' }
    
];

export default class CaseCustomerVehicle extends LightningElement {
    columns = COLUMNS;
    @api recordId;
    @wire(getRelatedCustomerVehicles , {recordId: '$recordId'})
    vehiclesCustomer; //results stored in this !

    connectedCallback(){
        //console.log('test', JSON.stringify(vehicles));
        console.log('hi from connected callback customer');
        //console.log(JSON.stringify(vehicles.data));
    }
}