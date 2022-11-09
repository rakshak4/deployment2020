/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   10-25-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class InvoiceTriggerHandler {
    public InvoiceTriggerHandler() {

    }
    /**
     * @description Method to select  relevant data from list of 
     * cases whose status changed to 'payment' and call method
     * AP04_SendEmail.sendEmail
     * @author Bhoovanyu Dhomah | 25/10/2022
     * @return Void.
     **/
    public void handleAfterInsert(List<Invoice__c> lstInv) {
        List<Invoice__c> lstInv2 = [SELECT Id,Contact__r.Email,AmountWithVat__c,Case__r.Type,Case__r.Reason,LastPaymentDate__c,Case__r.DamagedVehicle__r.RegistrationNumber__c  FROM Invoice__c WHERE Id IN :lstInv AND Contact__r.Email__c!=NULL];
        AP04_SendEmail.sendEmail(lstInv2);
    }
    /**
     * @description Method to call method sendErrorMessageIfBeforeDate fom class
     * AP_05PreventDelInvoiceBeforeDate and pass list of records user is deleting.
     * @author Bhoovanyu Dhomah | 25/10/2022
     * @return Void.
     **/
    public void handleBeforeDelete(List<Invoice__c> lstInv){
        AP_05PreventDelInvoiceBeforeDate.sendErrorMessageIfBeforeDate(lstInv);

    }
}