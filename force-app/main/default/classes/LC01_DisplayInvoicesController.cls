/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-28-2022   Ayman Rummun   Initial Version
**/
public with sharing class LC01_DisplayInvoicesController { 
    @AuraEnabled
    public static List<Invoice__c> getInvoices(String caseId){
        List<Invoice__c> lstInv = new List<Invoice__c>();
        try{
            lstInv = [SELECT Name, InvoiceDate__c, Account__c, AmountWithVat__c, Contact__c, AmountWithoutVat__c
            FROM Invoice__c WHERE Case__c =: caseId ORDER BY CreatedDate DESC];
         }
    
        catch(exception e)
        {
            System.debug('Error:' + e.getmessage());
        }
        return lstInv;
}
    


}