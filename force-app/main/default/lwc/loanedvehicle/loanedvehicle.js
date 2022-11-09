/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Asma Ghanty 
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-03-2022   Asma Ghanty   Initial Version
**/
import { LightningElement, api } from 'lwc';

export default class Loanedvehicle extends LightningElement {

    @api loanedvehicle;

    handleClick(){
        const event = new CustomEvent('itemclick', 
        {
            detail: this.loanedvehicle,
            bubbles: true,
            composed: true
        });

        // fire the event
        this.dispatchEvent(event);

    }

    }