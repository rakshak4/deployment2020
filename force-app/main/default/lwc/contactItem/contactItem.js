/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 01/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   01/11/2022   Souhayl Johar   Initial Version
**/
import { LightningElement, api } from 'lwc';

export default class ContactItem extends LightningElement {


    @api  contact;


    buttonClick() {
        const event = new CustomEvent('buttonClick', {
            // detail contains only primitives
            detail: this.contact,
            bubbles: true,
            composed:true
        });
        // Fire the event from c-tile
        this.dispatchEvent(event);
    }
}