/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 25/10/2022
 * @last modified by  : Souhayl Johar 
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   25/10/2022   Souhayl Johar   Initial Version
**/
public with sharing class AP01_CreateInvoice {
    public static void createInvoiceFromCase(List<Case> lstCas){

        List<Invoice__c> lstInvNew = new List<Invoice__c>();

        for (Case cas : lstCas) {
            Invoice__c inv = new Invoice__c(Account__c = cas.AccountId, Case__c = cas.Id, Contact__c = cas.ContactId, LastPaymentDate__c = System.today().addMonths(3));
            lstInvNew.add(inv);
        }

        if(lstInvNew.size()>0){
            insert lstInvNew;
        }
    }
}