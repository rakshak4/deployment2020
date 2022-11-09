/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-04-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-04-2022   Bhavish Nundoo   Initial Version
**/
public with sharing class AP01_displayListOfVehicle {
    @AuraEnabled
  public static List<Vehicle__c> getVehicle(Id recordId) {
  return [SELECT Model__c, RegistrationNumber__c, InsuranceStartDate__c, InsuranceEndDate__c,Contact__r.Id  FROM Vehicle__c Where Contact__r.Id!= Null AND Contact__r.Id=:recordId];
  }
}