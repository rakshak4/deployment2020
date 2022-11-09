/**
 * @File Name          : InvoiceTriggerHandler.cls
 * @Description        : case study 2:  As a customer, i should receive an email when my invoice is created
 * @Author             : MJH (Spoon Consulting)
 * @Group              :
 * @Last Modified By   : Mehreen Jhummun
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, 12:10:30             MJH      Initial Version
 **/

public with sharing class InvoiceTriggerHandler{
    /**
     * @description Method to handle handler after insert
     * @author Mehreen Jhummun | 25/10/2022
     * @return method handler
     **/
    public void handleAfterInsert(List<Invoice__c> lstNewInv) {
        // handler logic
        List<Invoice__c> lstInv = new List<Invoice__c>();
        for (Invoice__c invNew : lstNewInv) {
            lstInv.add(invNew);
        }
        if (lstInv.size() > 0) {
            AP002_SendEmailWhenInvoiceCreated.sendEmailFromInvoice(lstInv);
        }
    }


    /**
     * @description Method to handle handler before delete
     * @author Mehreen Jhummun | 25/10/2022
     * @return method handler
     **/



    public void handleBeforeDelete(List<Invoice__c> lstNewInv) {
        // handler logic
        List<Invoice__c> lstInv = new List<Invoice__c>();
        for (Invoice__c invNew : lstNewInv) {
            lstInv.add(invNew);
        }
        if (lstInv.size() > 0) {
            AP003_AlertDeleteInvoice.preventDeleteInvoice(lstInv);
        }
    }
}