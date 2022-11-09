/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-03-2022   Kanigan Somadoo   Initial Version
**/
import { LightningElement, api} from 'lwc';
import  getRelCasCusVehicle from '@salesforce/apex/LWC01_CaseRelatedVehicles.getCasRelCusVehicle';

export default class CaseRelatedVehicle extends LightningElement {

        @api recordId;
        cusvehicle = {};

        connectedCallback(){
                getRelCasCusVehicle({caseId: this.recordId})
                .then(result => {
                        this.cusvehicle = result;
                        console.log(this.cusvehicle);
                })
                .catch(error =>{
                        console.log(error);
                });
        }

}