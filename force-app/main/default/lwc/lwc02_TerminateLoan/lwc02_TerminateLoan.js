import { LightningElement, api } from 'lwc';
import terminateLoan from '@salesforce/apex/LWC02_TerminateLoan.terminateLoan';

export default class Lwc02_TerminateLoan extends LightningElement {
    @api recordid;
    @api variant;

    terminate() {
        terminateLoan({ recordId: this.recordid }).then(() => {
            // Creates the event with the data.
            const terminateEvent = new CustomEvent('terminated', {});

            // Dispatches the event.
            this.dispatchEvent(terminateEvent);
        }).catch((e) => {
            console.log('Error Terminating Loan: ', e.body.message);
        });
    }
}