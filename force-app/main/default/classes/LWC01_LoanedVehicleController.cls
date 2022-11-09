/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-06-2022
 * @last modified by  : Rayhaan Beeharry
**/
public with sharing class LWC01_LoanedVehicleController {
    
    @AuraEnabled(cacheable=true)
    public static List<Case> getLoanedVehicle(Id id) {
        List<Case> lstCas= [SELECT LoanedVehicle__r.Name,LoanedVehicle__r.Make__c,LoanedVehicle__r.Model__c,
        LoanedVehicle__r.YearOfVehicle__c,LoanedVehicle__r.LoanStartDate__c,LoanedVehicle__r.LoanedTo__c,LoanedVehicle__r.LoanEndDate__c FROM Case WHERE Id = :id];
        return lstCas;
    }
    
}