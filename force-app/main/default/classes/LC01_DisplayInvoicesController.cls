/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Jason Ramjaya
**/
public with sharing class LC01_DisplayInvoicesController {
    @AuraEnabled
    public static List<Invoices__c> getInvoices(Id caseIdToSearch){
        List<Invoices__c> lstInv = new List<Invoices__c>();

        lstInv = [SELECT Name, InvoiceDate__c, Account__c, AmountWithVat__c, Contact__c,
        AmountWithoutVat__c 
        FROM Invoices__c 
        WHERE CaseAssignedTo__c = :caseIdToSearch 
        ORDER BY CreatedDate DESC];

        return lstInv;
    }
}