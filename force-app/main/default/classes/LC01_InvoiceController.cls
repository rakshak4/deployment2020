/**
 * @description       : 
 * @author            : Sambhav Bholah
 * @group             : 
 * @last modified on  : 10-28-2022
 * @last modified by  : Sambhav Bholah
**/
public with sharing class LC01_InvoiceController {
    @AuraEnabled(cacheable=false)
    public static List<Invoice__c> getRelatedInvoices(Id idFetched) {
        system.debug('yoo wassup');
        system.debug(idFetched);
      List<Invoice__c> lstInvoice = [SELECT name, InvoiceDate__c, AmountWithVat__c, AmountWithoutVat__c, Contact__c  FROM Invoice__c WHERE Case__c =: idFetched];
      system.debug(lstInvoice);
      return lstInvoice;
    }
  }