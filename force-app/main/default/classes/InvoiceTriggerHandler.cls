/**
 * @File Name          : InvoiceTriggerHandler.cls
 * @Description        : As a customer i should receive an email (contact email) 
 *                         when my invoice is created
 * @Author             : Souhayl Johar
 * @Group              :
 * @Last Modified By   : Souhayl Johar
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      <SJO>      Initial Version
 **/

public with sharing class InvoiceTriggerHandler {

    public void handleAfterInsert(List<Invoice__c> lstInv) {
        List<Invoice__c> lstinvWithContact = new List<Invoice__c>();
        for (Invoice__c inv : lstInv) {
            if (inv.Contact__c != null) {
                lstinvWithContact.add(inv);
            }
        }
        AP02_SendEmail.sendEmail(lstinvWithContact);
    }


    public void handlerBeforeDelete(List<Invoice__c> lstInvDel){
        List<Invoice__c> lstInvWithPaymt = new List<Invoice__c>();
        for (invoice__c inv : lstInvDel) {
            if(inv.LastPaymentDate__c!= null){
                if(inv.LastPaymentDate__c > System.now()){
                lstInvWithPaymt.add(inv);
            }

            }
            
        }
        if (lstInvWithPaymt.size()>0) {
            AP03_PreventDeletionOfInvoice.preventInvDel(lstInvWithPaymt);
        }
       
    }
}