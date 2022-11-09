/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-25-2022   Asma Ghanty   Initial Version
**/
trigger InvoiceErrorTrigger on Invoices__c (after insert, before delete) {
    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();

    if(Trigger.isAfter && Trigger.isInsert){
        handler.handlerAfterInsert(Trigger.new);
    }

    if(Trigger.isBefore && Trigger.isDelete){
        handler.handlerBeforeDelete(Trigger.old);
    }

}