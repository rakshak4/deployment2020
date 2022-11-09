/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-04-2022   Asma Ghanty   Initial Version
**/
import { LightningElement, api, wire } from 'lwc';
import getConVehicles from '@salesforce/apex/LC01_contactQuiz.getConVehicles';

export default class ContactQuiz extends LightningElement {
    @api vehicles;
    @wire (getConVehicles) vehicles;


    

}