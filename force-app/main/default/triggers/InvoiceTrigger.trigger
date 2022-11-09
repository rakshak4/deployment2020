/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Chevish Boodhun   Initial Version
**/
trigger InvoiceTrigger on Invoice__c (after insert, before delete) {

    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();
    if (trigger.isAfter && trigger.isInsert) {
        handler.handleAfterInsert(trigger.new);
    }

    if (trigger.isBefore && trigger.isDelete) {
        handler.handleBeforeDelete(trigger.old);
    }

}