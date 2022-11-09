/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-25-2022   Asma Ghanty   Initial Version
**/
public with sharing class EmailTriggerHandler {

    /**
    * @description 
    * @author Asma Ghanty | 10-25-2022 
    * @param List<Invoices__c> lstInvoiceIns 
    * @param = new 
    * @param List<Invoices__c> 
    **/
    public void handleAfterInsert(List<Invoices__c> lstInvoiceIns){
        List<Invoices__c> lstInvContact = new List<Invoices__c>();
        //lstInvoiceIns= [SELECT Contact__r.Email, InvoiceNumber__c, AmountWithVat__c, LastPaymentDate__c, Case__r.Type, Case__r.Reason, Case__r.Vehicle__r.RegistrationNumber__c FROM Invoices__c WHERE Id=:lstInvoiceIns.Id];

        for(Invoices__c inv: lstInvoiceIns){
            if (inv.Contact__c!= null){
                lstInvContact.add(inv);

            }
        }
       
            AP02_SendEmailInvoice.sendEmail(lstInvContact);
                
        
}
}