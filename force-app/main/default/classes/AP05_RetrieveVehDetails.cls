/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Ashita Gopaul
**/
public with sharing class AP05_RetrieveVehDetails {
    @AuraEnabled(cacheable=true)

    public static List<Case> getDetails(String caseID) {
        return [SELECT Id, CaseNumber, Vehicle__r.Name, Vehicle__r.Make__c, Vehicle__r.Model__c, Vehicle__r.Mileage__c, 
        Vehicle__r.LoanEndDate__c FROM Case WHERE Id=:caseID];
    }
}