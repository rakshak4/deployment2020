/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 05/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   04/11/2022   Akhilesh Ramchurn   Initial Version
 **/
public with sharing class LWC02_RetrieveVehicleContact {
    @AuraEnabled
    public static List<Vehicle__c> getcontactVehicleList(Id recordId) {
        List<Vehicle__c> lstVeh = [
            SELECT Name,Make__c ,Colour__c, Model__c, RegistrationNumber__c, InsuranceStartDate__c, InsuranceEndDate__c
            FROM Vehicle__c
            WHERE Contact__c = :recordId
        ];
        return lstVeh;
    }
}