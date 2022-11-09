import { api, LightningElement } from 'lwc';
import getDamageVehicles from '@salesforce/apex/AP09_GetVehiclesForCaseLWC1.getDamageVehicles';


export default class RelatedVehiclesToCase extends LightningElement {

    
   @api recordId;
   @api vehicles;

    connectedCallback(){

        console.log('connected');

        getDamageVehicles({recordId:this.recordId}).then(result=>{
            this.vehicles=result;
            console.log(this.vehicles);
        }).catch(e=>{console.log('error',e);})

    }
}