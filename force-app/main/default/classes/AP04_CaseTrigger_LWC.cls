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
public with sharing class AP04_CaseTrigger_LWC {
    public map<String, List<Vehicle__c>> handleBeforeInsert(List<Case> lstCas){

        List<Case> lstCasWithVeh = new List<Case>();
        map<String, List<Vehicle__c>> mapValues =  new map<String, List<Vehicle__c>>();
        List<Id> lstVehIds = new List<Id>();

        for (Case cas: lstCas){
            if (cas.Vehicle__c != NULL){
                lstCasWithVeh.add(cas);
                lstVehIds.add(cas.Vehicle__c);
            }
        }

        System.debug('List size'+ lstCas.size());

        if (lstCasWithVeh.size() > 0){
            mapValues = AP04_GetVehicleDetails.getVehDetails(lstCasWithVeh, lstVehIds);
            System.debug('>>>>>>>>>>>>>>>'+ mapValues);
        }

        return mapValues;
    }
}