/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 10-28-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-28-2022   Asma Ghanty   Initial Version
**/
public with sharing class LC03_RetrieveInvoicesToCase {
    @AuraEnabled 
    public static List <Invoices__c> getRelatedInvoices(String caseIdToSearch){
       
        List<Invoices__c> lstInvoices = [SELECT Case__c, InvoiceNumber__c, InvoiceDate__c, Account__c, 
                                            AmountWithVat__c, Contact__c, AmountWithoutVat__c FROM Invoices__c 
                                            WHERE Case__c =: caseIdToSearch ORDER BY CreatedDate DESC];
        return lstInvoices;

   
}
}