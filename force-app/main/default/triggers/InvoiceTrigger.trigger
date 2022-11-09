/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-25-2022   Keny Poisson   Initial Version
**/
trigger InvoiceTrigger on invoice__c (after insert, before delete) {

    /**
    * @description 
    * @author Keny Poisson | 10-25-2022 
    **/
   InvoiceTriggerHandler handler = new InvoiceTriggerHandler();

   if (Trigger.isAfter && Trigger.isInsert) {
    handler.handleAfterInsert(Trigger.new);
  }

  if (Trigger.isBefore && Trigger.isDelete){

    handler.handleBeforeDelete(Trigger.old);

  }

}