/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Jason Ramjaya
**/
public with sharing class LWC01_RetrieveVehicles {
    @AuraEnabled(cacheable=true)
    public static Case getCaseDetail(String caseId) {
        return [SELECT LoanedVehicle__r.LoanEndDate__c, LoanedVehicle__r.Name, CustomerVehicle__r.Name, CustomerVehicle__c, LoanedVehicle__c 
        FROM Case 
        WHERE Id = :caseId];
    }
}