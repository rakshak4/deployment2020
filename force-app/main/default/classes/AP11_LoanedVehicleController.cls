/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-03-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class AP11_LoanedVehicleController {
    public AP11_LoanedVehicleController() {

    }
    @AuraEnabled(cacheable=true)
    public static Case getLoanedVeh(Id recordId){

        List<Case> lstCas = [SELECT LoanedVehicle__r.LoanEndDate__c, LoanedVehicle__c, LoanedVehicle__r.Model__c,LoanedVehicle__r.Make__c FROM Case WHERE Id =:recordId];

        return lstCas[0];
    }
}