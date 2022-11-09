/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-02-2022   Chevish Boodhun   Initial Version
**/
public with sharing class CaseVehicleDetailsController {

    @AuraEnabled
    public static Case getCaseVehicles(Id caseId) {
        
        return [SELECT DamagedVehicle__c, LoanedVehicle__c, LoanedVehicle__r.LoanEndDate__c FROM Case WHERE Id = :caseId];

    }

}