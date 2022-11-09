/**
 * @File Name          : InvoiceTrigger.trigger
 * @Description        : case study 3: trigger on  As a customer, i should receive an email when my invoice is created
 * @Author             : MJH (Spoon Consulting)
 * @Group              :
 * @Last Modified By   : Mehreen Jhummun
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, 12:09:30             MJH      Initial Version
 **/
trigger InvoiceTriggerCase3 on Invoice__c(before delete) {
    InvoiceTriggerHandlerCase3 handler = new InvoiceTriggerHandlerCase3();
    if (Trigger.isBefore && Trigger.isDelete) {
        handler.handleBeforeDelete(Trigger.old);
    }

}