/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 11-06-2022
 * @last modified by  : Ashita Gopaul
**/
public with sharing class LWC03_DisplayVehicles {  
        @AuraEnabled(cacheable=true)
        public static List<Vehicles__c> getVehicleList(String contactId){
            return[SELECT Id, Colour__c, Make__c, Model__c, RegistrationNumber__c, InsuranceStartDate__c, InsuranceEndDate__c FROM Vehicles__c 
            WHERE Contact__c=:contactId];
        }
}