/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 07/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   03/11/2022   Akhilesh Ramchurn   Initial Version
 **/
public with sharing class LWC01_RetrieveCustomerVehicle {
    @AuraEnabled
    public static List<Case> getCustomerVehicleList(Id recordId) {
        List<Case> lstCusVeh = [SELECT Id, DamagedVehicle__r.Name, DamagedVehicle__r.Make__c FROM Case WHERE Id = :recordId];
        return lstCusVeh;
    }
}