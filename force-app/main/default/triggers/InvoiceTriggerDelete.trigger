/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 26/10/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   26/10/2022   Narmeen Nehor   Initial Version
**/
trigger InvoiceTriggerDelete on Invoice__c (before delete) {
    InvoiceTriggerDeleteHandler handler = new InvoiceTriggerDeleteHandler();

    if (Trigger.isBefore && Trigger.isDelete){
        handler.handlerBeforeDelete(Trigger.old);
    }
    

}