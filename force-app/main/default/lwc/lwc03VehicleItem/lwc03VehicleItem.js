import { LightningElement , api} from 'lwc';

export default class Lwc03VehicleItem extends LightningElement {

    @api vehicle;
    colorStyle = '';

    connectedCallback(){
        this.colorStyle = '--sds-c-icon-color-background: white; --sds-c-icon-color-foreground: '+this.vehicle.Colour__c+';';
    }

}