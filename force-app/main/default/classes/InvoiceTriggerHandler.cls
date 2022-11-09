/**
 * @File Name          : InvoiceTriggerHandle.cls
 * @Description        : Handler class for trigger on Invoice object
 * @Author             : Jason Ramjaya
 * @Group              :
 * @Last Modified By   : Jason Ramjaya
 * @Last Modified On   : 10-25-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022                    JRA         Initial Version
 **/
public with sharing class InvoiceTriggerHandler {
    /**
     * @description handler for after insert of invoice trigger
     * @author Jason Ramjaya | 10-25-2022
     * @param lstInvs
     **/
    public void handleAfterInsert(List<Invoices__c> lstInvs) {

        AP03_CreateInvoice.sendEmail(lstInvs);
        
    }

    /**
    * @description handler before delete of invoice 
    * @author Jason Ramjaya | 10-25-2022 
    * @param lstInvs 
    **/
    public void handleBeforeDelete(List<Invoices__c> lstInvs) {
        AP03_CreateInvoice.preventInvoiceDelete(lstInvs);
    }
}