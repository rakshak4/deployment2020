/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Rayhaan Beeharry
**/
public with sharing class LC01_GetRelatedInvoices {
    @AuraEnabled
    public static List<Invoice__c> getRelatedInvoices(String caseId){
        List<Invoice__c> lstInv = new List<Invoice__c>();
        try {
            lstInv = [SELECT Id,Name FROM Invoice__c WHERE Case__c=:caseId ORDER BY InvoiceDate__c DESC];
        }catch (Exception e) {
            System.debug(e.getMessage());
        }
        return lstInv;
    }
}