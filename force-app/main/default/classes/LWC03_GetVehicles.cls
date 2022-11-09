/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-04-2022   Ayman Rummun   Initial Version
**/
public with sharing class LWC03_GetVehicles {
    @AuraEnabled(cacheable=true)
    public static List<Vehicle__c> getVehicle(Id contactId)
    {
        List<Vehicle__c> lstVeh = [
            SELECT Model__c, Make__c, RegistrationNumber__c, InsuranceEndDate__c, InsuranceStartDate__c, Colour__c 
            FROM Vehicle__c
            WHERE Contact__c =: contactId];

        return lstVeh;
    }
}