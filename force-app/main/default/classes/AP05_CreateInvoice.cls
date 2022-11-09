/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-25-2022   Keny Poisson   Initial Version
**/
public with sharing class AP05_CreateInvoice {
   

    public static void CreateInvoiceFromCase(List<Case> lstCas){

        List <invoice__c> lstInvNew= new List <invoice__c>();

        for (Case casNew : lstCas) {

            invoice__c inv = new invoice__c();
            inv.Account__c = casNew.AccountId;
            inv.Contact__c = casNew.ContactId;
            inv.Case__c = casNew.ParentId;
            inv.LastPaymentDate__c = Date.today().addMonths(3);
            lstInvNew.add(inv);
            
            
          }
          if (lstInvNew.size()>0){
            insert lstInvNew;
          }

    
        }
    
}