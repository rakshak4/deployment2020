/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Rayhaan Beeharry
**/
public with sharing class LW01_ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Vehicles__c> getVehicles(Id contactId){
        try {
            List<Vehicles__c> lstVeh =[SELECT Colour__c,Make__c,Model__c,RegistrationNumber__c,InsuranceEndDate__c,InsuranceStartDate__c 
            FROM Vehicles__c
            WHERE Contact__c =: contactId];
            return lstVeh;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
}