/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Chevish Boodhun   Initial Version
**/
public with sharing class AP03_CreateInvoice {

    public static void createInvoiceFromCase(List<Case> lstCse) {

        List<Invoice__c> lstInvNew = new List<Invoice__c>();

        for (Case cse : lstCse) {
            Invoice__c inv = new Invoice__c(
                Case__c = cse.Id,
                Account__c = cse.AccountId,
                Contact__c = cse.ContactId,
                LastPaymentDate__c = System.today().addMonths(3)
            );
            lstInvNew.add(inv);
        }

        if (lstInvNew.size() > 0) {
            insert lstInvNew;
        }

    }

}