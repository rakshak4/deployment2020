/**
 * @description       : Apex class containig all logic for trigger Create Invoice
 * @author            : Rakshak Rajjoo
 * @last modified on  : 25/10/2022
 * @last modified by  : Rakshak Rajjoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   25/10/2022   Rakshak Rajjoo   Initial Version
 **/
public with sharing class AP01_CreateInvoice {
    /**
     * @description method to create anew ivoice using case
     * @author Rakshak Rajjoo | 25/10/2022
     * @param List<Case> lstCas
     **/
    public static void createInvoiceFromCase(List<Case> lstCas) {
        List<Invoice__c> lstInvNew = new List<Invoice__c>();

        for (Case cas : lstCas) {
            Invoice__c inv = new Invoice__c(Account__c = cas.AccountId, Case__c = cas.Id, Contact__c = cas.ContactId, LastPaymentDate__c = cas.CreatedDate.addMonths(3));
            lstInvNew.add(inv);
        }

        if (lstInvNew.size() > 0) {
            insert lstInvNew;
        }
    }
}