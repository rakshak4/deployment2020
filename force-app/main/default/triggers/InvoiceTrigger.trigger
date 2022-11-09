/**
 * @description       : Trigger when invoice is created
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 26/10/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   25/10/2022   Akhilesh Ramchurn   Initial Version
**/
trigger InvoiceTrigger on Invoice__c (after insert, before delete) {

    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();
    if(Trigger.isAfter && Trigger.isInsert){
        handler.handleAfterInsert(Trigger.new);
    }
    
    if(Trigger.isbefore && Trigger.isDelete){
        handler.handleBeforeDelete(Trigger.old);
    }

}