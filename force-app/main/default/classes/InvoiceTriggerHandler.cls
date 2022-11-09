/**
 * @description       : Handler for the invoice trigger
 * @author            : Rayhaan Beeharry
 * @group             :
 * @last modified on  : 10-26-2022
 * @last modified by  : Rayhaan Beeharry
 **/
public with sharing class InvoiceTriggerHandler {
    public void handleAfterInsert(List<Invoice__c> lstInvoice) {
        // Get the full records for the Invoices to obtain the relationships
        List<Invoice__c> lstInvoiceToUse = new List<Invoice__c>();
        for(Invoice__c inv : lstInvoice){
            if(inv.Contact__c!=null){
                lstInvoiceToUse.add(inv);
            }
        }
        System.debug(lstInvoiceToUse);
        AP04_SendMailForInvoiceCreation.sendMail(lstInvoiceToUse);
    }

    public void handleBeforeDelete(List<Invoice__c> lstInvoice){
        List<Invoice__c> lstInvoiceCannotDelete = new List<Invoice__c>();
        for(Invoice__c inv : lstInvoice){
            if(inv.LastPaymentDate__c > Date.today()){
                lstInvoiceCannotDelete.add(inv);
            }
        }
        System.debug(lstInvoiceCannotDelete);
        AP05_PreventDeletion.preventDeletion(lstInvoiceCannotDelete);
    }

    public static Boolean checkIfAgent() {
        String profileName = [SELECT Name FROM Profile WHERE Id = :UserInfo.getProfileId()][0].Name;
        Boolean isAgent;
        return profileName == 'Agent';
    }
}