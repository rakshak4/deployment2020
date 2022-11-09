/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Kanigan Somadoo   Initial Version
**/
public with sharing class InvoiceTriggerHandler {

    /**
    * @description 
    * @author Kanigan Somadoo | 10-25-2022 
    * @param List<Invoice__c> lstInvoice 
    **/
    public void handleAfterInsert(List<Invoice__c> lstInvoice){

        //filtering : Fetch all invoices that have contact emails from case associated with it

        List<Invoice__c> lstInvoiceWithEmail = new List<Invoice__c>();

        for(Invoice__c inv : lstInvoice){

            if(inv.Contact__c != null)
            lstInvoiceWithEmail.add(inv);

        }

        System.debug('List of contacts with email : ' + lstInvoiceWithEmail);

        if(lstInvoiceWithEmail.size() > 0) {
            // Call method with functionality and pass as argument lstInvoiceWithEmail
            AP05_SendInvoiceEmail.sendInvoiceEmail(lstInvoiceWithEmail);
            System.debug('Successfully called method to send email');

        }


        

    }

    public void handleBeforeDelete(List<Invoice__c> lstInvoice){

        // filter list of invoices to  addError when last payment date is not yet reached
        
        List<Invoice__c> lstInvCannoDelete = new List<Invoice__c>();

        for(Invoice__c inv : lstInvoice){
            if(System.now() < inv.LastPaymentDate__c){
                lstInvCannoDelete.add(inv);
            }
        }

        if(lstInvCannoDelete.size() > 0){
            AP06_preventInvDelete.preventDelete(lstInvCannoDelete);
        }

    }
    
}