/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 10-28-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-28-2022   Keny Poisson   Initial Version
**/
public with sharing class AP08_invoiceController {
    
    @AuraEnabled
   public static List <invoice__c> getInvoices(String id){

    List <invoice__c> lstInvoice=[SELECT AmountWithVat__c FROM invoice__c WHERE Case__c=: id ];
    return lstInvoice;

   }
}