/**
 * @File Name          : InvoiceTrigger.trigger
 * @Description        : Trigger invoice to send email
 * @Author             : Ashita Gopaul
 * @Group              :
 * @Last Modified By   : Ashita Gopaul
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      <AGO>      Initial Version
 **/
trigger InvoiceTrigger on Invoices__c(after insert, before delete) {
    InvTriggerHandler handler = new InvTriggerHandler();
    if (Trigger.isAfter && Trigger.isInsert) {
        handler.handleAfterInsert(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isDelete){
        handler.handleBeforeDelete(Trigger.old);
    }

}