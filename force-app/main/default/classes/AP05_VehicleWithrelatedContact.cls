/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 04/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   04/11/2022   Souhayl Johar   Initial Version
**/
public with sharing class AP05_VehicleWithrelatedContact {
 @AuraEnabled 

 public static List<vehicle__c> getVehicles(Id recordId) {

            List<vehicle__c> lstVeh = [Select Id,Model__c, registrationNumber__c,
                                            InsuranceEndDate__c, InsuranceStartDate__c
                                        FROM vehicle__c 
                                        WHERE Contact__c=:recordId];
    
            return lstVeh;
        }
    }