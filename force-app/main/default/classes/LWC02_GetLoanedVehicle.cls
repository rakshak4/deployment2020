/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-03-2022   Ayman Rummun   Initial Version
**/
public with sharing class LWC02_GetLoanedVehicle {
    @AuraEnabled(cacheable=true)
    public static List<Vehicle__c> getLoanedVehicleDetails(Id recordId) {

        List<case> lstcase = [SELECT Id, LoanedVehicle__c FROM Case WHERE Id = :recordId];

        Set<Id> setLoanVehicleId = new Set<Id>();
        for (Case cas : lstcase) {
            setLoanVehicleId.add(cas.LoanedVehicle__c);
        }

        List<Vehicle__c> vehicle = [SELECT Make__c, Model__c, LoanEndDate__c FROM Vehicle__c WHERE Id IN :setLoanVehicleId];
        return vehicle;

        // Case vehicle = [SELECT Vehicle__c, Vehicle__r.Name, Vehicle__r.Make__c FROM Case];
        // return vehicle;
    }
}