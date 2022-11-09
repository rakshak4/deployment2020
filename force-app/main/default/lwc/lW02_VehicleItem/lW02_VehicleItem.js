/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 04/11/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   04/11/2022   Narmeen Nehor   Initial Version
**/
import { LightningElement, api } from 'lwc';

export default class LW02_VehicleItem extends LightningElement {
    @api vehicle;

    contactClick() {
        console.log('sending event', this.vehicle)
        const event = new CustomEvent('vehicleClick', {
            // detail contains only primitives
            detail: this.vehicle,
            bubbles: true,
            composed: true

        });
        // Fire the event from c-tile
        this.dispatchEvent(event);
    }

}