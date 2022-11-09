/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Ashita Gopaul
**/
public with sharing class AP01_CreateInvoice {
    
    public static void createInvoiceFromCase(List<Case>lstCas){
        List<Invoices__c>lstInNew=new List<Invoices__c>();

        for(Case cas: lstCas){
            Invoices__c inv = new Invoices__c(Account__c=cas.AccountId, Case__c=cas.Id, Contact__c=cas.ContactId, LastPaymentDate__c=cas.CreatedDate.addMonths(3));
            lstInNew.add(inv);

        }
        if(lstInNew.size()>0){
            insert lstInNew;
        }
    }
}