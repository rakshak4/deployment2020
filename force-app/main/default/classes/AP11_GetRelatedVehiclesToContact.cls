/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-04-2022   Keny Poisson   Initial Version
**/
public with sharing class AP11_GetRelatedVehiclesToContact {
   

    @AuraEnabled(cacheable=true)
    public static List <Vehicle__c> getRelatedVehicles(Id recordId) {

        List <vehicle__c> lstGetVehicles= new List <vehicle__c>();
        lstGetVehicles= [SELECT Colour__c,EngineCapacity__c,Make__c,Model__c FROM 
        Vehicle__c WHERE Contact__r.Id=:recordId];

        return lstGetVehicles;

    }
}