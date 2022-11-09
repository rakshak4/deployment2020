/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Rayhaan Beeharry
**/
import { LightningElement,api} from 'lwc';

export default class Lwc02TerminateLoan extends LightningElement {
    @api disabled
    terminateEvent(){
        const event = new CustomEvent("terminateloan",{
            bubbles: true,
            composed: true
        });
        this.dispatchEvent(event);
    }
}