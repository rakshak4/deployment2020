import { LightningElement,api } from 'lwc';

export default class Lwc04VehicleItem extends LightningElement {
    @api vehicle;
    renderedCallback() { 

        this.initCSSVariables();

        /* JFYI, use a flag if you only want to run this logic on first render of the component. */

    }

    initCSSVariables() {
        var css = this.template.host.style;
        css.setProperty('--color', this.vehicle.Colour__c);
    }
}