/**
 * @File Name          : InvoiceTrigger.trigger
 * @Description        : case study 2: trigger on  As a customer, i should receive an email when my invoice is created
 * @Author             : MJH (Spoon Consulting)
 * @Group              :
 * @Last Modified By   : Mehreen Jhummun
 * @Last Modified On   : 25/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, 12:09:30             MJH      Initial Version
 **/
trigger InvoiceTrigger on Invoice__c(after insert) {
    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();
    if (Trigger.isAfter && Trigger.isInsert) {
        handler.handleAfterInsert(Trigger.new);
    }

}