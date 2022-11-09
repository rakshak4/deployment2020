/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 02/11/2022
 * @last modified by  : Narmeen Nehor 
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   02/11/2022   Narmeen Nehor   Initial Version
**/
public with sharing class AP04_GetVehicleDetails {
    public static map<String, List<Vehicle__c>> getVehDetails(List<Case> lstCas, List<Id> lstVehIds){

        System.debug('lstCas' + lstCas);

        Map<String, List<Vehicle__c>> mapRecTypeToCase = new Map<String, List<Vehicle__c>>();

        for (Vehicle__c veh: [SELECT Id, Name, RegistrationNumber__c, Model__c, RecordType.DeveloperName FROM Vehicle__c WHERE Id IN: lstVehIds]){

            System.debug('In loop case details' + veh);

            if (mapRecTypeToCase.containsKey(veh.RecordType.DeveloperName)){
                mapRecTypeToCase.get(veh.RecordType.DeveloperName).add(veh);
            }
            else{
                mapRecTypeToCase.put(veh.RecordType.DeveloperName, new List<Vehicle__c>{veh});
            }
        }

        System.debug('<<<<<<<<<<' + mapRecTypeToCase);

        return mapRecTypeToCase;
    }
}