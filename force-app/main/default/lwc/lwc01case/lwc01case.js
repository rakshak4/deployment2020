/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 03/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   03/11/2022   Souhayl Johar   Initial Version
**/
import { LightningElement ,api} from 'lwc';
import findVehicles from '@salesforce/apex/AP01_DisplayVehicle.findVehicles';

export default class Lwc01case extends LightningElement {
    @api recordId;
    @api vehicles;

    connectedCallback(){
        findVehicles({recordId:this.recordId}).then(result => {
            this.vehicles = result;
            console.log(this.vehicles)
            console.log(result +'qqqqqqqqq')
        }).catch(e => {console.log('Error:' +e);
    
        });
    }
    
    }