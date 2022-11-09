/**
 * @description       : 
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 25/10/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   25/10/2022   Akhilesh Ramchurn   Initial Version
**/
public with sharing class AP03_CreateInvoice {
    public static void createInvoiceFromCase(List<Case> lstCse){
        
        List<Invoice__c> lstInv = new List<Invoice__c>();
        for(Case cse : lstCse){
            Invoice__c inv = new Invoice__c(
                    Case__c =cse.Id,
                    Account__c = cse.AccountId,
                    Contact__c = cse.ContactId,
                    LastPaymentDate__c = System.today().addMonths(3)
                    );
            lstInv.add(inv);

        }

        if(lstInv.size()>0){
            insert lstInv;
        }            
    }
}