/**
 * @description       : Trigger on Invoice object
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Rayhaan Beeharry
**/
trigger InvoiceTrigger on Invoice__c (after insert, before delete) {
    InvoiceTriggerHandler handler= new InvoiceTriggerHandler();

    if(trigger.isAfter && trigger.isInsert){
        handler.handleAfterInsert(trigger.new);
    }

    if(trigger.isBefore && trigger.isDelete){
        handler.handleBeforeDelete(trigger.old);
    } 
}