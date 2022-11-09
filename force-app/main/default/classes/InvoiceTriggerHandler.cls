/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Chevish Boodhun   Initial Version
**/
public with sharing class InvoiceTriggerHandler {

    public void handleAfterInsert(List<Invoice__c> lstNewInv) {

        AP04_SendEmailInvoice.sendEmailAfterInvoice(lstNewInv);

    }

    public void handleBeforeDelete(List<Invoice__c> lstOldInv) {

        List<Invoice__c> lstInvDel = new List<Invoice__c>();
        for (Invoice__c inv : lstOldInv) {
            if (inv.LastPaymentDate__c > System.now()) {
                lstInvDel.add(inv);
            }
        }

        if (lstInvDel.size() > 0) {
            AP05_PreventInvoiceDelete.preventDelete(lstInvDel);
        }

    }
    
}