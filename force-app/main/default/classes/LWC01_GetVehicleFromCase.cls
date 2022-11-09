/**
 * @description       :
 * @author            : Ayman Rummun
 * @group             :
 * @last modified on  : 11-03-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-02-2022   Ayman Rummun   Initial Version
 **/
public with sharing class LWC01_GetVehicleFromCase {
    @AuraEnabled(cacheable=true)
    public static List<Vehicle__c> getVehicleDetails(Id caseId) {
        // Vehicle__c vehicle = [SELECT Name, Make__c, Model__c FROM Vehicle__c LIMIT 1];
        // System.debug('################################### ' + vehicle);
        // return vehicle;

        List<case> lstcase = [SELECT Id, VehicleId__c FROM Case WHERE Id = :caseId];

        Set<Id> setVehicleId = new Set<Id>();
        for (Case cas : lstcase) {
            setVehicleId.add(cas.VehicleId__c);
        }

        List<Vehicle__c> vehicle = [SELECT Make__c, Model__c, LoanEndDate__c FROM Vehicle__c WHERE Id IN :setVehicleId];
        return vehicle;

        // Case vehicle = [SELECT Vehicle__c, Vehicle__r.Name, Vehicle__r.Make__c FROM Case];
        // return vehicle;
    }

    // @AuraEnabled(cacheable=true)
    // public static Case findVehicle(String recordId)
    // {
    //     Case vehicle = [SELECT Vehicle__c, Vehicle__r.Name, Vehicle__r.Make__c FROM Case];
    //     return vehicle;
    // }
}