/**
 * @File Name          : AP01_CreateInvoice.cls
 * @Description        : case study 1: Handler on As an agent, i want an invoice to be created
 *                       after a claim has been processed so as to issue payment to the customer
 * @Author             : MJH (Spoon Consulting)
 * @Group              :
 * @Last Modified By   : Mehreen Jhummun
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, 10:09:30             MJH      Initial Version
 **/
public with sharing class AP001_CreateInvoice {
    public static void createInvoiceFromCase(List<Case> lstCas) {
        List<Invoice__c> lstInvNew = new List<Invoice__c>();

        for (Case cas : lstCas) {
            Invoice__c inv = new Invoice__c
            (
                Case__c = cas.Id, 
                Account__c = cas.AccountId, 
                Contact__c = cas.ContactId,
                LastPaymentDate__c = cas.CreatedDate.addMonths(3)
            );

            lstInvNew.add(inv);
        }
        if (lstInvNew.size() > 0) {
            insert lstInvNew;
        }
    }
}