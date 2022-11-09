/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-04-2022   Ayman Rummun   Initial Version
**/
import { LightningElement, api} from 'lwc';
import getVehicle from '@salesforce/apex/LWC03_GetVehicles.getVehicle';

export default class VehicleItem extends LightningElement {
@api cid;

@api vehicles =[];

    connectedCallback()
    {
        getVehicle({contactId: this.cid}).then((response) => {
            this.vehicles = response;
            console.log('vehicle: ', response);
        }).catch((error) =>{
            console.log('Error: ', error.body.message);
        });
   
    }

    activeSectionsMessage = '';

    handleSectionToggle(event) {
        const openSections = event.detail.openSections;

        if (openSections.length === 0) {
            this.activeSectionsMessage = 'All sections are closed';
        } else {
            this.activeSectionsMessage =
                'Open sections: ' + openSections.join(', ');
        }
    }
}