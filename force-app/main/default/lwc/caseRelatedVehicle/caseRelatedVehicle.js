import { LightningElement ,api, wire} from 'lwc';
// import { getSObjectValue } from '@salesforce/apex';
// import { getFieldValue } from 'lightning/uiRecordApi';
import getRelatedLoanedVehicles from '@salesforce/apex/LWC02_VehicleController.getRelatedLoanedVehicles';

import MAKE_FIELD from '@salesforce/schema/Vehicle__c.Make__c';
import MODEL_FIELD from '@salesforce/schema/Vehicle__c.Model__c';
import LOANENDDATE_FIELD from '@salesforce/schema/Vehicle__c.LoanEndDate__c';
//copy columns into next

const COLUMNS = [
    { label: 'Vehicle Make', fieldName: MAKE_FIELD.fieldApiName, type: 'text' },
    { label: 'Vehicle Model', fieldName: MODEL_FIELD.fieldApiName, type: 'text' },
    { label: 'Vehicle Loan Date End', fieldName: LOANENDDATE_FIELD.fieldApiName, type: 'date' }
    
];
export default class CaseRelatedVehicle extends LightningElement {
    columns = COLUMNS;
    @api recordid;
    @wire(getRelatedLoanedVehicles , {recordId: '$recordid'})
    vehicles; //results stored in this !

    checkLoan(){
        console.log('here in check loan');
        //console.log('main and data ', JSON.stringify(this.vehicles.data)); //>
        //format 📝
        //[{"Make__c":"Mazda","Model__c":"Rx7","LoanEndDate__c":"2022-11-09","Id":"a007S0000037wuLQAQ"}]
        //console.log('just make', JSON.stringify(this.vehicles.data[0].Make__c)); //>
        let carLoanEndDate = this.vehicles.data[0].LoanEndDate__c;
        console.log(carLoanEndDate);
        let x = new Date(carLoanEndDate);
        console.log(x);
        let today = new Date() //.toISOString().slice(0, 10)
        console.log(today);
        
        let Difference_In_Time = x.getTime() - today.getTime();
        let Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24)
        console.log(Difference_In_Days);

        if(Difference_In_Days < 3){
            console.log('hi');
            //now modify color
        }
 
    }

    terminateLoan(){
        
    }


    connectedCallback(){
        //console.log('test', JSON.stringify(vehicles));
        console.log('hi from connected callback case');
        //console.log(JSON.stringify(vehicles.data));
    }

}