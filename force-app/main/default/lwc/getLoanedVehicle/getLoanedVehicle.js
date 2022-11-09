import { api, LightningElement } from 'lwc';
import getLoanedVehicles from '@salesforce/apex/AP10_GetLoanedVehicleChildLWC1.getLoanedVehicles';

export default class GetLoanedVehicle extends LightningElement {

      
   @api caseId;
   @api vehiclesLoan;



    connectedCallback(){

        //test 

        console.log('connected');
        console.log('record id', this.caseId);

        getLoanedVehicles({recordId:this.caseId}).then(result=>{
            this.vehiclesLoan=result;
            console.log('loaned vehiucle',this.vehicles);
        }).catch(e=>{console.log('error',e);})

        

    }

}