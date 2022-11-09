/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   KSO               Initial Version
**/
trigger InvoiceTrigger on Invoice__c (after insert, before delete) {

    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();
    
    if(Trigger.isAfter && Trigger.isInsert){
        handler.handleAfterInsert(Trigger.new);

        System.debug('Trigger.new : '+ Trigger.new);

    }


    if(Trigger.isBefore && Trigger.isDelete){
        //Call handlerBeforeDelete
        handler.handleBeforeDelete(Trigger.old);
    }


    


}