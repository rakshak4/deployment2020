/**
 * @File Name          : CaseTrigger.trigger
 * @Description        : As a customer, i should receive an email when my invoice is created
 * @Author             : Narmeen Nehor
 * @Group              : 
 * @Last Modified By   : Narmeen Nehor
 * @Last Modified On   : 25/10/2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      SNA      Initial Version
**/
trigger InvoiceTrigger on Invoice__c (after insert) {
    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();

    if (Trigger.isAfter && Trigger.isInsert){
        handler.handleAfterInsert(Trigger.new);
    }
}