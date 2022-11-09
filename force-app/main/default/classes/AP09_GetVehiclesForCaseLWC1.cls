/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-03-2022   Keny Poisson   Initial Version
**/
public with sharing class AP09_GetVehiclesForCaseLWC1 {

    @AuraEnabled(cacheable=true)
    public static List <Case> getDamageVehicles(Id recordId) {

        List <Case> lstGetVehicles= new List <Case>();
        lstGetVehicles= [SELECT Id,DamageVehicle__r.Model__c,
          DamageVehicle__r.RegistrationNumber__c FROM Case WHERE Id=:recordId];
        return lstGetVehicles;

    }
}

// LoanVehicle__r.Model__c,LoanVehicle__r.RegistrationNumber__c,
//          LoanVehicle__r.InsuranceEndDate__c