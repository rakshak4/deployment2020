/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-25-2022   Asma Ghanty   Initial Version
**/
public with sharing class AP01_CreateInvoice {
    public static void createInvoiceFromCase(List<Case>lstCas){
        List<Invoices__c>lstInvNew = new List<Invoices__c>();

        for (Case cas: lstCas){
            Invoices__c inv = new Invoices__c(Account__c = cas.AccountId, Case__c=cas.Id, Contact__c=cas.ContactId, LastPaymentDate__c=cas.CreatedDate.addMonths(3));
            lstInvNew.add(inv);
        }
        if(lstInvNew.size()>0){
            insert lstInvNew;
        }

    }
}