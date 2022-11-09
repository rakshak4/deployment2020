/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-03-2022   Kanigan Somadoo   Initial Version
**/
public with sharing class LWC01_CaseRelatedVehicles {
    
    @AuraEnabled(cacheable=true)
    public static Case getCasRelCusVehicle(Id caseId) {
        List<Case> casCusVehicle =  [SELECT  DamagedVehicle__c, DamagedVehicle__r.RegistrationNumber__c, DamagedVehicle__r.Make__c, DamagedVehicle__r.Model__c
        FROM Case 
        WHERE Id = :caseId
        LIMIT 1 ];

        return casCusVehicle[0];
    }

}