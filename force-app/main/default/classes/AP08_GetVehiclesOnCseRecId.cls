/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-02-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class AP08_GetVehiclesOnCseRecId {
    @AuraEnabled(cacheable=true)
    public static List<Vehicle__c> getVehicles(String recordId){
        System.debug('data from AP get vehicles: '+recordId);

        List<Case> lstCas = [Select DamagedVehicle__c,LoanedVehicle__c FROM Case WHERE Id =:recordId];

        System.debug('List'+lstCas);

        Set<Id> setVeh = new Set<Id>();
        // for(Case veh: lstCas){
        //     setVeh.add(veh.Id);
        //     System.debug('set '+veh.DamagedVehicle__c);
        // }

        setVeh.add(lstCas[0].DamagedVehicle__c);
        setVeh.add(lstCas[0].LoanedVehicle__c);
        System.debug('set '+setVeh);

        List<Vehicle__c> lstVeh = [SELECT Model__c, Make__c, LoanEndDate__c FROM Vehicle__c WHERE Id IN: setVeh];

        

        system.debug(lstVeh);
        system.debug(lstVeh[0].Model__c);
        return lstVeh;

    }
    
}