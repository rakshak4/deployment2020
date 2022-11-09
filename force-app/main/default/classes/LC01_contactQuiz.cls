/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-04-2022   Asma Ghanty   Initial Version
**/
public with sharing class LC01_contactQuiz {
    @AuraEnabled (cacheable=true)
    public static List<Vehicles__c> getConVehicles(Id contactId){
        List<Vehicles__c> lstVeh = [SELECT Model__c, Make__c FROM Vehicles__c WHERE Id =: contactId];
        return lstVeh;

    }
}