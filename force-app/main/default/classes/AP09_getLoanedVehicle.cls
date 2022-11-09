/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-03-2022   Asma Ghanty   Initial Version
**/
public with sharing class AP09_getLoanedVehicle {

    @AuraEnabled (cacheable=true)
    public static List<Vehicles__c> getLoanedVeh(Id recordId){
        List<Case> lstCurrentCase = [SELECT LoanedVehicle__c FROM Case WHERE Id =: recordId];
        
        List<Vehicles__c> lstVehicle = [SELECT Make__c,  Model__c, LoanEndDate__c FROM Vehicles__c WHERE Id =: lstCurrentCase[0].LoanedVehicle__c];
        system.debug(lstVehicle);
        return lstVehicle;
    }

}