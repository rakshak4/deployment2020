/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 03/11/2022
 * @last modified by  : Narmeen Nehor 
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   03/11/2022   Narmeen Nehor   Initial Version
**/
public with sharing class AP05_DisplayVehicles {
    
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
          ];
          return lstcaseLoanedVehicle;
        }
}