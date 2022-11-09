/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Jason Ramjaya
**/
public with sharing class LWC02_GetContactVehicles {
    @AuraEnabled
    public static List<Vehicles__c> getVehicles(String contactId){
        return [SELECT Model__c, Make__c, RegistrationNumber__c, InsuranceStartDate__c, InsuranceEndDate__c, Colour__c 
        FROM Vehicles__c 
        WHERE OwnerContact__c =: contactId];
    }

}