/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-04-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class AP12_DisplayVehicles {
    
    @AuraEnabled(cacheable=true)
    public static List<Vehicle__c> getContactVeh(Id recordId){

        List<Vehicle__c> lstVeh = [SELECT Colour__c,Id, Model__c,RegistrationNumber__c,InsuranceStartDate__c,InsuranceEndDate__c FROM Vehicle__c WHERE Contact__c =:recordId];

        System.debug(lstVeh);
        return lstVeh;
    }
}