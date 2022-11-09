/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 03/11/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   02/11/2022   Mehreen Jhummun   Initial Version
**/



import { api, LightningElement, wire } from 'lwc';
import displayDetails from '@salesforce/apex/AP01_SelectDetail.displayDetails';


export default class Lwc01CustomerVehicle extends LightningElement {
    @api recordId;

    @wire(displayDetails,{caseid:'$recordId'})
    vehicledetail;

   

    

}