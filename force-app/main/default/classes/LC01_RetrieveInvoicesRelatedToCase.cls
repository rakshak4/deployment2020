/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 10-28-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-28-2022   Kanigan Somadoo   Initial Version
**/
public with sharing class LC01_RetrieveInvoicesRelatedToCase {
    
    @AuraEnabled
    public static List<Invoice__c> getInvoices(String caseId){

        List<Invoice__c> lstInvoice = [SELECT Name, InvoiceNumber__c, AmountWithoutVat__c,AmountWithVat__c, LastPaymentDate__c
        FROM Invoice__c
        WHERE Case__c = :caseId
        ORDER BY CreatedDate DESC];
    
        return lstInvoice;
    }
}