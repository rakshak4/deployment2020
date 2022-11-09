/**
 * @File Name          : InvoiceTrigger.trigger
 * @Description        : Trigger on Object Invoice
 * @Author             : Spoon Consulting
 * @Group              : 
 * @Last Modified By   : Ayman Rummun
 * @Last Modified On   : 10-25-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022      <ARU>      Initial Version
**/
trigger InvoiceTrigger on Invoice__c (after insert, before delete) {

    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();

    if(trigger.isAfter && trigger.isInsert)
    {
        handler.handleAfterInsert(trigger.new);
    }

    if(trigger.isBefore && trigger.isDelete)
    {
        handler.handleBeforeDelete(trigger.old);
    }

}