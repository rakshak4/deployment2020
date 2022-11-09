/**
 * @File Name          : InvoiceDeleteTrigger.trigger
 * @Description        : Trigger to throw error if agent try to delete invoice before paymentdate
 * @Author             : Bhavish Nundoo
 * @Group              :
 * @Last Modified By   : Bhavish Nundoo
 * @Last Modified On   : 10-25-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      BNU      Initial Version
 **/
trigger InvoiceDeleteTrigger on Invoice__c(before delete) {
    InvoiceDeleteTriggerHandler handler = new InvoiceDeleteTriggerHandler();

    if (Trigger.isBefore && Trigger.isDelete) {
        handler.handlerBeforeDelete(Trigger.old);
    }

}