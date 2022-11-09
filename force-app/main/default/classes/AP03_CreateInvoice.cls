/**
 * @description       :
 * @author            : Rayhaan Beeharry
 * @group             :
 * @last modified on  : 10-25-2022
 * @last modified by  : Rayhaan Beeharry
 **/
public class AP03_CreateInvoice {
    public static void createInvoice(List<Case> lstCas) {
        List<Invoice__c> lstInvoices = new List<Invoice__c>();
        for (Case cas : lstCas) {
            // Set last date of payment to three months from now
            Date lastPaymentDate = System.today().addMonths(3);
            // Create new Invoice and add to list
            lstInvoices.add(new Invoice__c(Account__c = cas.AccountId, Contact__c = cas.ContactId, Case__c = cas.Id, LastPaymentDate__c = lastPaymentDate));
        }
        if(lstInvoices.size()>0)
            insert lstInvoices;
    }
}