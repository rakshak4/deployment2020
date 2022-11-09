/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-07-2022   Asma Ghanty   Initial Version
**/
public with sharing class LC02_CaseRelatedInvoiceCtrl {
    @AuraEnabled
    public static List<Invoices__c> getInvoices(Id caseId){
        List<Invoices__c> lstInv = [SELECT Name, InvoiceDate__c, Account__c, AmountWithVat__c, Contact__c, AmountWithoutVat__c
        FROM Invoices__c WHERE Case__c =: caseId ORDER BY CreatedDate DESC];
        return lstInv;
    }
    
}