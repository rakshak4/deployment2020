/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 07/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   28/10/2022   Akhilesh Ramchurn   Initial Version
 **/
public with sharing class LC01_RetrieveInvoicesCaseController {
    @AuraEnabled
    public static List<Invoice__c> getRelatedInvoices(Id caseId) {
        List<Invoice__c> lstInvoices = [SELECT Id, Name, InvoiceDate__c, AmountWithVat__c, AmountWithoutVat__c FROM Invoice__c WHERE Case__c = :caseId ORDER BY CreatedDate DESC];
        return lstInvoices;
    }
}