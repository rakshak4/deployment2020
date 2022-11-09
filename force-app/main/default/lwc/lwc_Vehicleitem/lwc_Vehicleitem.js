/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 04/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   04/11/2022   Souhayl Johar   Initial Version
**/
import { LightningElement, api } from 'lwc';
import getVehicles from '@salesforce/apex/AP05_VehicleWithrelatedContact.getVehicles';

export default class Lwc_Vehicleitem extends LightningElement {
@api recordId;
@api vehicles;

connectedCallback(){
    getVehicles({recordId:this.recordId}).then(result => {
        this.vehicles = result;
        console.log(this.vehicles)
        console.log(result +'qqqqqqqqq')
    }).catch(e => {console.log('Error:' +e);

    });
}

}