/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-04-2022   Chevish Boodhun   Initial Version
**/
import { api, LightningElement } from 'lwc';

export default class Lwc01VehicleItemm extends LightningElement {

    @api vehicle;

    get iconStyle() {
        return `--sds-c-icon-color-background: ${this.vehicle.Colour__c};`
    }

}