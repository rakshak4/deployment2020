/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-03-2022   Bhavish Nundoo   Initial Version
**/
public with sharing class AP01_customerVehicleController {
    @AuraEnabled
  public static List<Case> getCustomerVehicle(Id recordId) {
  return [SELECT Id, LoanedVehicle__r.Name,LoanedVehicle__r.RecordType.DeveloperName FROM Case WHERE LoanedVehicle__c != null AND LoanedVehicle__r.RecordType.DeveloperName='CustomerVehicle' AND Id=:recordId];
  }
}