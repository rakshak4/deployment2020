/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-03-2022   Kanigan Somadoo   Initial Version
**/
public with sharing class LWC02_CaseRelatedLoanVehicle {
    @AuraEnabled(cacheable=true)
    public static Case getCasRelLoanVehicle(Id caseId) {
        List<Case> casLoanVehicle =  [SELECT  LoanVehicle__c, LoanVehicle__r.Make__c, LoanVehicle__r.Model__c,
        LoanVehicle__r.LoanStartDate__c, LoanVehicle__r.LoanEndDate__c
        FROM Case 
        WHERE Id = :caseId
        LIMIT 1 ];

        return casLoanVehicle[0];
    }
}