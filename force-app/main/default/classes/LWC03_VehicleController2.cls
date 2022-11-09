/**
 * @description       : 
 * @author            : Sambhav Bholah
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Sambhav Bholah
**/
public with sharing class LWC03_VehicleController2 {
    @AuraEnabled(cacheable=true)

    public static List<Vehicle__c> getRelatedCustomerVehicles(Id recordId){

        List<Case> lstCurrentCase = [SELECT Account__c  FROM Case WHERE Id =: recordId];
        
        List<Vehicle__c> lstVehicleCustomer = [SELECT Make__c, 	Model__c FROM Vehicle__c WHERE InsuredTo__c =: lstCurrentCase[0].Account__c];
        system.debug('this is customer vehicle' + lstVehicleCustomer);
        
        return lstVehicleCustomer;
        //SELECT Make__c, Model__c  FROM Vehicle__c WHERE InsuredTo__c = '0017S00000FmUSPQA3'
    }
}