/**
 * @description       :  Trigger that executes after insert on Object Invoice
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   10-25-2022   Bhoovanyu Dhomah   Initial Version
**/
trigger InvoiceTrigger on Invoice__c (after insert, before delete ) {
    InvoiceTriggerHandler handler  = new InvoiceTriggerHandler();
    if(Trigger.isAfter && Trigger.isInsert){
        handler.handleAfterInsert(Trigger.new);

    }

    if(Trigger.isBefore && Trigger.isDelete){
        handler.handleBeforeDelete(Trigger.old);
    }



}