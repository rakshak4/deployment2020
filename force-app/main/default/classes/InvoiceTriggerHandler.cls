/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-26-2022   Asma Ghanty   Initial Version
**/
public with sharing class InvoiceTriggerHandler {

    public void handlerAfterInsert(List<Invoices__c> lstInv){
        List<Invoices__c> lstInv2 = new List<Invoices__c>();

        for (Invoices__c inv : lstInv) {
            if(inv.Contact__c != null)
            {
                lstInv2.add(inv);
            }   
        }

        // if(lstInv2.size()> 0)
        // {
        //     AP03_SendingEmailForUseCase02.sendMail(lstInv2);
        // }
    }
    
 

    public void handlerBeforeDelete(List<Invoices__c>lstInvoicesDel){
        List<Invoices__c> lstInvPaymentDate = new List<Invoices__c>();
        for(Invoices__c inv: lstInvoicesDel){
            if(inv.LastPaymentDate__c!=null){
                if(inv.LastPaymentDate__c > System.now()){
                lstInvPaymentDate.add(inv);
            }
        }
        
    }
    if(lstInvPaymentDate.size()>0){
        AP03_ErrorMsgOnDelete.PreventDelInvoice(lstInvPaymentDate);
    }
}
}