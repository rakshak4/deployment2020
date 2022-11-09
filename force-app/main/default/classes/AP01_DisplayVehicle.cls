/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 03/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   03/11/2022   Souhayl Johar   Initial Version
**/
public with sharing class AP01_DisplayVehicle {
    @AuraEnabled(cacheable=true)
    public static List<Case> findVehicles(Id recordId) {
      List<case> lstcaseLoanedVehicle = [
        SELECT
          Id,
          Vehicle__c,
          Vehicle__r.EngineCapacity__c,
          Vehicle__r.InsuranceEndDate__c,
          Vehicle__r.InsuranceStartDate__c,
          Vehicle__r.InsuredTo__c,
          Vehicle__r.InsuredTo__r.Active__c
        FROM Case
        WHERE Vehicle__c != NULL AND Id =: recordId

    //     SELECT  EngineCapacity__c,
    //        InsuranceEndDate__c,
    //    InsuranceStartDate__c,
    //     InsuredTo__c,
    //       InsuredTo__r.Active__c
    //        FROM Vehicle__c
    //        WHERE Id = vehicle__c
      ];
      return lstcaseLoanedVehicle;
    }
  }