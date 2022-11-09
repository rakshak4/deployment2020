/**
 * @description       : Handler cass for InvoiceTrigger
 * @author            : Rakshak Rajjoo
 * @last modified on  : 25/10/2022
 * @last modified by  : Rakshak Rajjoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   25/10/2022   Rakshak Rajjoo   Initial Version
 **/
public with sharing class InvoiceTriggerHandler {
    /**
     * @description method to handle AfterInsert Event
     * @author Rakshak Rajjoo | 25/10/2022
     * @param List<Invoice__c> lstInv
     **/
    public void handleAfterInsert(List<Invoice__c> lstInvNew) {
        List<Invoice__c> lstInvWithCon = new List<Invoice__c>();

        for (Invoice__c inv : lstInvNew) {
            if (inv.Contact__c != null) {
                lstInvWithCon.add(inv);
            }
        }

        if (lstInvWithCon.size() > 0) {
            AP02_SendEmail.sentEmailToContact(lstInvWithCon);
        }
    }
}