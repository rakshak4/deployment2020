/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
public with sharing class LWC01_CustomerVehicleController {
    @AuraEnabled(cacheable=true)
    public static List<Case> getCustomerVehicle(Id id) {
       List<Case> lstCas= [SELECT CustomerVehicle__r.Name,CustomerVehicle__r.Make__c,CustomerVehicle__r.Model__c,
       CustomerVehicle__r.RegistrationNumber__c,CustomerVehicle__r.InsuredTo__c,
       CustomerVehicle__r.InsuranceStartDate__c,CustomerVehicle__r.InsuranceEndDate__c FROM Case WHERE Id = :id];
       return lstCas;
    }
}