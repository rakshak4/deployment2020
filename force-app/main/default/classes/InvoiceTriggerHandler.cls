/**
 * @File Name          : <CaseTrigger>.trigger
 * @Description        : <short description>
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : Sambhav Bholah
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-OCT-222, HH:MM:SS      SBH      Initial Version
 **/

public with sharing class InvoiceTriggerHandler {
    /**
     * @description       :
     * @author            : Sambhav Bholah
     * @group             :
     * @last modified on  : 10-26-2022
     * @last modified by  : Sambhav Bholah
     **/

    public void handleAfterInsert(List<Invoice__c> lstInv) {

        List<Invoice__c> lstWithContactEmails = [SELECT Name, Contact__r.Email__c FROM Invoice__c WHERE Contact__r.Email__c <> NULL];
        
        AP02_SendMail.sendEmail(lstWithContactEmails); 
    }

    public void handleBeforeInsert(List<Invoice__c> lstInvDel){

        List<Invoice__c> lstInvWithPayment = new List<Invoice__c>();
        //check if field null
        //check for date here

        for(Invoice__c inv: lstInvDel){
            if(inv.LastPaymentDate__c != NULL){
                if(inv.LastPaymentDate__c > system.now()){
                    lstInvWithPayment.add(inv);
                }
            }
        }

        if(lstInvWithPayment.size() > 0 ){
            AP02_SendMail.preventDelete(lstInvWithPayment);
        }
        
    }
}