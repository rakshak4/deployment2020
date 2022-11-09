/**
 * @description       : Trigger on Invoice__c Object
 * @author            : Rakshak Rajjoo
 * @last modified on  : 25/10/2022
 * @last modified by  : Rakshak Rajjoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   25/10/2022   Rakshak Rajjoo   Initial Version
 **/
trigger InvoiceTrigger on Invoice__c(after insert) {
    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();

    if (Trigger.isAfter && Trigger.isInsert) {
        handler.handleAfterInsert(Trigger.new);
    }
}