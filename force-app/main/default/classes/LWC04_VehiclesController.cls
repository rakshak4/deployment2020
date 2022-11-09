/**
 * @description       : 
 * @author            : Sambhav Bholah
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Sambhav Bholah
**/
public with sharing class LWC04_VehiclesController {
    @AuraEnabled(cacheable=true)

    public static List<Vehicle__c> getRelatedContactVehicles(Id recordId){
        
        List<Vehicle__c> lstContactVehicle = [SELECT Make__c, Model__c FROM Vehicle__c WHERE Contact__c =: recordId];
        system.debug('this is customer vehicle' + lstContactVehicle);
        
        return lstContactVehicle;
        //SELECT Make__c, Model__c  FROM Vehicle__c WHERE InsuredTo__c = '0017S00000FmUSPQA3'
    }
}