/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-28-2022   Chevish Boodhun   Initial Version
**/
public with sharing class LC01_CaseInvoicesController {
    
    @AuraEnabled
    public static List<Invoice__c> getRelatedInvoices(Id caseId) {

        return [SELECT Id, Name, AmountWithoutVat__c FROM Invoice__c WHERE Case__c = :caseId ORDER BY CreatedDate DESC];

    }

}