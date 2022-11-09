/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 28/10/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   28/10/2022   Souhayl Johar   Initial Version
**/
public with sharing class LC03_InvoiceRelatedToCase {
    
    @AuraEnabled
    public static list<Invoice__c> getInvoices(String caseIdToSearch){
    
        List<Invoice__c> lstInv = [SELECT id,Name, InvoiceDate__c, Account__c, AmountWithVat__c, Contact__c, AmountwithoutVat__c 
        FROM Invoice__c WHERE Case__c = :caseIdToSearch 
        ORDER BY CreatedDate DESC];
        return lstInv;
    }
}