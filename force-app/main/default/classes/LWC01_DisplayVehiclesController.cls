/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-04-2022   Chevish Boodhun   Initial Version
**/
public with sharing class LWC01_DisplayVehiclesController {
    @AuraEnabled
    public static List<Vehicle__c> getRelatedVehicles(Id contactId){
        
        return [SELECT Id, Name, Model__c, RegistrationNumber__c, InsuranceStartDate__c, InsuranceEndDate__c, Colour__c FROM Vehicle__c WHERE Contact__c = :contactId];
        
    }
}