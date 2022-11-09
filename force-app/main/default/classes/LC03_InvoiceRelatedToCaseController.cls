/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 28/10/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   28/10/2022   Narmeen Nehor   Initial Version
**/
public with sharing class LC03_InvoiceRelatedToCaseController {
    @AuraEnabled
    public static List<Invoice__c> getInvoices(String caseIdToSearch){
        List<Invoice__c> lstInvoices = [SELECT Id, Name, InvoiceDate__c, Account__c, AmountwithVat__c, Contact__c, AmountwithoutVat__c FROM Invoice__c WHERE Case__c=:caseIdToSearch AND Case__r.Status = 'payment' ORDER BY CreatedDate  DESC];
        return lstInvoices;
    }

}