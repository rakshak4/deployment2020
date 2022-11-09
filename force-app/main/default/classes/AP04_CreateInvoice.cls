/**
 * @description       :
 * @author            : Kanigan Somadoo
 * @group             :
 * @last modified on  : 10-25-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Kanigan Somadoo   Initial Version
 **/
public with sharing class AP04_CreateInvoice {
    public static void createInvoiceFromCase(List<Case> lstCas) {
        List<Invoice__c> lstInvNew = new List<Invoice__c>();

        for (Case cas : lstCas) {
            Invoice__c inv = new Invoice__c(Case__c = cas.Id, Account__c = cas.AccountId, Contact__c = cas.ContactId, LastPaymentDate__c = Date.today().addMonths(3));
            lstInvNew.add(inv);
        }

        if(lstInvNew.size() > 0) {
            insert lstInvNew;
        }
    }
}