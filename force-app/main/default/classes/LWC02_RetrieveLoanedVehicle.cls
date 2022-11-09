/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 05/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   03/11/2022   Akhilesh Ramchurn   Initial Version
 **/
public with sharing class LWC02_RetrieveLoanedVehicle {
    @AuraEnabled
    public static List<Case> getLoanedVehicleList(Id recordId) {
        List<Case> lstLoaVeh = [SELECT Id, LoanedVehicle__r.Name, LoanedVehicle__r.Make__c, LoanedVehicle__r.LoanEndDate__c FROM Case WHERE Id = :recordId];
        return lstLoaVeh;
    }
}