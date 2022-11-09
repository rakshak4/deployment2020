/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Ashita Gopaul
**/
public with sharing class lwcLoanedVehiclesController {
    @AuraEnabled(cacheable=true)

    public static List<Case> getLoanedVehDetails(String caseID) {
        return [SELECT Id, CaseNumber, LoanedVehicle__r.Name, LoanedVehicle__r.Make__c, LoanedVehicle__r.Model__c, LoanedVehicle__r.Mileage__c, 
        LoanedVehicle__r.LoanEndDate__c FROM Case WHERE Id=:caseID];
    }
}