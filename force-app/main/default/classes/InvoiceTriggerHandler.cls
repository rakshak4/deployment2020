/**
 * @description       : Handle invoice trigger
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 26/10/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   25/10/2022   Akhilesh Ramchurn   Initial Version
**/
public with sharing class InvoiceTriggerHandler {
    public void handleAfterInsert(List<Invoice__c> lstNewInv) {
        
        AP04_SendEmailAfterInvoice.sendEmail(lstNewInv);

    }


    public void handleBeforeDelete(List<Invoice__c> lstOldInv) {

        List<Invoice__c> lstInvDel = new List<Invoice__c>();
        for (Invoice__c inv : lstOldInv) {
            if (inv.LastPaymentDate__c > System.now()) {
                lstInvDel.add(inv);
            }
        }

        if (lstInvDel.size() > 0) {
            AP05_PreventDeleteInvoice.preventDelete(lstInvDel);
        }

    }
}