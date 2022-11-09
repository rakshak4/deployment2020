/**
 * @File Name          : invoiceTrigger.trigger
 * @Description        : Trigger for object Invoice
 * @Author             : Jason Ramjaya
 * @Group              :
 * @Last Modified By   : Jason Ramjaya
 * @Last Modified On   : 10-25-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022                    JRA         Initial Version
 **/
trigger invoiceTrigger on Invoices__c (after insert, before delete) {
    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();

    if (Trigger.isAfter && Trigger.isInsert) {
        handler.handleAfterInsert(Trigger.new);
    }

    if (Trigger.isBefore && Trigger.isDelete) {
        handler.handleBeforeDelete(Trigger.old);
    }
}