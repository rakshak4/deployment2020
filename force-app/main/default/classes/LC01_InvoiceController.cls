/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 10-28-2022
 * @last modified by  : Ashita Gopaul
**/
public with sharing class LC01_InvoiceController {
    @AuraEnabled
    public static List<Invoices__c> getRelatedInvoices(String caseId){
        List<Invoices__c> lstInvoices= [SELECT Name, InvoiceDate__c, Account__c, 
        AmountWithVat__c, Contact__c,AmountWithoutVat__c FROM Invoices__c WHERE Case__c=:caseId];
        return lstInvoices;
    }
}