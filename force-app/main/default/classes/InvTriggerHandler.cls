/**
 * @File Name          : InvTriggerHandler.cls
 * @Description        : Handler for trigger on invoice
 * @Author             : Ashita Gopaul
 * @Group              :
 * @Last Modified By   : Ashita Gopaul
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      <AGO>      Initial Version
 **/
public with sharing class InvTriggerHandler {
    public void handleAfterInsert(List<Invoices__c> lstInvNew) {      
        List<Invoices__c>lstInvoices=[SELECT Id, Name, AmountWithVat__c, Case__r.Type, Case__r.Reason, Case__r.Vehicle__r.RegistrationNumber__c, LastPaymentDate__c, Contact__r.Email FROM Invoices__c WHERE Contact__c != null];
        
        if (lstInvoices.size() > 0) {
            AP02_SendEmail.sendEmailFromInvoice(lstInvoices);
        }
    }

    public void handleBeforeDelete(List<Invoices__c> lstOld){
        List<Invoices__c> lstInvPayment= new List<Invoices__c>();
        for(Invoices__c inv: lstOld){
            if(inv.LastPaymentDate__c!=null){
                if(inv.LastPaymentDate__c> System.now()){
                    lstInvPayment.add(inv);
                }
            }
        }
        if(lstInvPayment.size()>0){
            AP03_PreventDeletion.PreventDeletion(lstInvPayment);
        }
    }


}