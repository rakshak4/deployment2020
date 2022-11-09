/**
 * @File Name          : InvoiceTriggerHandler.cls
 * @Description        : Handler for Object Invoice
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : Ayman Rummun
 * @Last Modified On   : 11-08-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022      <ARU>      Initial Version
 **/
public with sharing class InvoiceTriggerHandler {
    public void handleAfterInsert(List<Invoice__c> lstInv) {

        List<Invoice__c> lstInv2 = new List<Invoice__c>();

        for (Invoice__c inv : lstInv) {
            if(inv.Contact__c != null)
            {
                lstInv2.add(inv);
            }   
        }

        if(lstInv2.size()> 0)
        {
            AP03_SendingEmailForUseCase02.sendMail(lstInv2);
        }
    }

    public void handleBeforeDelete(List<Invoice__c> lstInv)
    {
        List<Invoice__c> lstInv2 = new List<Invoice__c>();

        for (Invoice__c inv : lstInv) {
                lstInv2.add(inv);   
        }

        if(lstInv2.size()> 0)
        {
            AP05_EnableDeletionOfInvoice.unenableDeletionOfInvoiceIfPaymentDateIsBeforeLastDate(lstInv2);
        }
    }
}