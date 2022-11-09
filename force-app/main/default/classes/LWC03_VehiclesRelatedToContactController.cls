/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-04-2022   Kanigan Somadoo   Initial Version
**/
public with sharing class LWC03_VehiclesRelatedToContactController {
    @AuraEnabled
    public static List<Vehicle__c> getVehiclesRelatedToContact(Id conId) {

        List<Vehicle__c> lstVeh = [SELECT Contact__c,Make__c,Model__c, RegistrationNumber__c, InsuranceStartDate__c,
        InsuranceEndDate__c
        FROM Vehicle__c
        WHERE Contact__c=:conId];

        return lstVeh;
    }
}