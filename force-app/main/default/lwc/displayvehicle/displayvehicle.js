/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-02-2022   Ayman Rummun   Initial Version
**/
import { LightningElement, api, wire } from 'lwc';
import getVehicleDetails from '@salesforce/apex/LWC01_GetVehicleFromCase.getVehicleDetails';

export default class Displayvehicle extends LightningElement {
      @api recordId;
      @api vehicles =[];

    connectedCallback()
    {
        getVehicleDetails({caseId: this.recordId}).then((response) => {
            this.vehicles = response;
            console.log('vehicle: ', response);
        }).catch((error) =>{
            console.log('Error: ', error.body.message);
        });

        

        // get getterMethod()
        // {
            
        // }
    }

      // // @wire(findVehicle, { recordId: '$recordId' })
    // // vehicle;

    // @wire(getVehicleDetails, { recordId: '$recordId' }) vehicles;

    // findVehicle().then(response => {
    //     this.vehicles = response;
    // }).catch(error =>{
    //     console.log('Error: ', error.body.message);
    // });

    // connectedCallback()
    // {
    //     console.log("connectedCallback:", this.vehicles)
    // }

}