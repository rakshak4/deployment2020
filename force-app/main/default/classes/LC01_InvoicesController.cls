/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   10-28-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class LC01_InvoicesController {
    // public LC01_InvoicesController() {

    // }
    @AuraEnabled
    public static List<Invoice__c> getInvoices(String caseId){
        System.debug('ID::: '+ caseId);
        // List<Invoice__c> lstInv = [SELECT Id, Name FROM Invoice__c WHERE Case__c =: caseId ORDER BY CreatedDate DESC];
        List<Invoice__c> lstInv = new List<Invoice__c>();
        try{
            lstInv = [SELECT Id, Name, AmountWithoutVat__c FROM Invoice__c WHERE Case__c =: caseId ORDER BY CreatedDate DESC];
        }catch(Exception e){
            System.debug('An exception occured:'+e.getMessage());
            // throw new Exceptions.SystemException('An exception occured');
            // return null;
            // return('Exception occured');
        }
        return lstInv;
    }
}