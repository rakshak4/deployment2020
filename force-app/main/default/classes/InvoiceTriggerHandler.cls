/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 25/10/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   25/10/2022   Narmeen Nehor   Initial Version
**/
public with sharing class InvoiceTriggerHandler {
    public void handleAfterInsert(List<Invoice__c> lstInv) {
        List<Invoice__c> lstinvWithContact = new List<Invoice__c>();
        for (Invoice__c inv : lstInv) {
            if (inv.Contact__c != null) {
                lstinvWithContact.add(inv);
            }
        }
        AP02_SendEmail.sendEmail(lstinvWithContact);
    }

}