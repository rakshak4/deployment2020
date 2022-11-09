/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 05/11/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   04/11/2022   Narmeen Nehor   Initial Version
**/
public with sharing class AP06_GetListOfVehicles {
@AuraEnabled(cacheable=true)

public static List<Vehicle__c> getVehicles(string caseId){
    
List<Vehicle__c> vehList = [SELECT Id, Model__c, RegistrationNumber__c, InsuranceStartDate__c, InsuranceEndDate__C 
FROM Vehicle__c 
WHERE Contact__c =:caseId];
    
    return vehList;
    
    }
}