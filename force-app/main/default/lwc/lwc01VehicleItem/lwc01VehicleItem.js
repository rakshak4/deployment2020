/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Rayhaan Beeharry
**/
import { LightningElement,api } from 'lwc';

export default class Lwc01VehicleItem extends LightningElement {
    @api vehicle;
    colour;
    connectedCallback(){
        this.colour= "background-color: "+this.vehicle.Colour__c+";";
    }
}