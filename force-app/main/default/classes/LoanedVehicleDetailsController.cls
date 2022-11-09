/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Chevish Boodhun 
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-03-2022   Chevish Boodhun   Initial Version
**/
public with sharing class LoanedVehicleDetailsController {

    @AuraEnabled
    public static void removeLoanedVehicle(Id caseId, Id vehicleId) {
        
        Case currentCase = [SELECT Id FROM Case WHERE Id = :caseId];
        Vehicle__c loanedVehicle = [SELECT Id FROM Vehicle__c WHERE Id = :vehicleId];

        if (currentCase != null) {
            currentCase.LoanedVehicle__c = null;
            update currentCase;
        }
        if (loanedVehicle != null) {
            loanedVehicle.Status__c = 'Available';
            loanedVehicle.LoanedTo__c = null;
            loanedVehicle.LoanEndDate__c = null;
            loanedVehicle.LoanStartDate__c = null;
            update loanedVehicle;
        }

    }

}