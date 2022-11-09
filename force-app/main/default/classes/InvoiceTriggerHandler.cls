/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-25-2022   Keny Poisson   Initial Version
**/
public with sharing class InvoiceTriggerHandler {

 
    
    public void handleAfterInsert(List<invoice__c> lstInvoice){

              System.debug('Pass API06');

        AP06_mail.sendEmail(lstInvoice);
        System.debug(lstInvoice);

    }

    public void handleBeforeDelete(List<invoice__c> lstInvoice){

        List<invoice__c> lstThrowError= new List <invoice__c>();

        for (invoice__c inv:lstInvoice){
            if (inv.LastPaymentDate__c!=null) {
                if (inv.LastPaymentDate__c>=System.today()) {
                    lstThrowError.add(inv);
                    
                }
                
            }
        }

        if (lstThrowError.size()>0) {
            
            AP07_ErrorMessage.sendErrorMessage(lstThrowError);
        }
        
    }
}