/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-03-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class AP10_customerVehicleController {
    @AuraEnabled(cacheable=true)
    public static Case getCustomerVeh(Id recordId){

        List<Case> lstCas = [SELECT DamagedVehicle__c, DamagedVehicle__r.Model__c,DamagedVehicle__r.Make__c FROM Case WHERE Id =:recordId];

        return lstCas[0];
        // Set<Id> setVehId = new Set<Id>();
        // setVehId.add(lstCas[0].DamagedVehicle__c);
        // setVehId.add(lstCas[0].LoanedVehicle__c);

        // List<Vehicle__c> lstVeh = [SELECT Model__c, Make__c FROM Vehicle__c WHERE Id=:vehId];
        // List<Vehicle__c> lstVeh = [SELECT LoanEndDate__c, Vehicle__c.RecordType.DeveloperName, Model__c, Make__c FROM Vehicle__c WHERE Id IN :setVehId ];

        // List<Vehicle__c> lstVehOrdered = new List<Vehicle__c>();
        // lstVehOrdered[0].add(new Vehicle__c());

        // // System.debug(lstVeh);
        // System.debug('damaged vehicle '+lstVeh);
        // System.debug('damaged vehicle details '+lstVeh[0].RecordType.DeveloperName);
        // return lstVeh[0];
    }
}