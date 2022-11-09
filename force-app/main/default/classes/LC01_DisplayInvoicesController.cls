/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 10-28-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   10-28-2022   Bhavish Nundoo   Initial Version
**/
public with sharing class LC01_DisplayInvoicesController {
    @AuraEnabled
    public static List<Invoice__c> getInvoices(String recordId){
        List<Invoice__c> lstinv = [SELECT Name,Case__c,Account__c, Contact__c, AmountWithoutVat__c, AmountWithVat__c, LastPaymentDate__c, InvoiceDate__c  FROM Invoice__c WHERE Case__c=:recordId ORDER BY InvoiceDate__c DESC];
        return lstinv;
    
    }
}