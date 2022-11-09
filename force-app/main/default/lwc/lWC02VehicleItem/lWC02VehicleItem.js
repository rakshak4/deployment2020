import { LightningElement ,api, wire} from 'lwc';
import getRelatedContactVehicles from '@salesforce/apex/LWC04_VehiclesController.getRelatedContactVehicles';

import MAKE_FIELD from '@salesforce/schema/Vehicle__c.Make__c';
import MODEL_FIELD from '@salesforce/schema/Vehicle__c.Model__c';
import LOANENDDATE_FIELD from '@salesforce/schema/Vehicle__c.LoanEndDate__c';

const COLUMNS = [
    { label: 'Vehicle Make', fieldName: MAKE_FIELD.fieldApiName, type: 'text' },
    { label: 'Vehicle Model', fieldName: MODEL_FIELD.fieldApiName, type: 'text' },
    { label: 'Vehicle Loan Date End', fieldName: LOANENDDATE_FIELD.fieldApiName, type: 'date' }
];

export default class LWC02_VehicleItem extends LightningElement {
    columns = COLUMNS;
    @api recordid;
    @wire(getRelatedContactVehicles , {recordid: '$recordId'})
    vehicles = {}; 
    
    
}