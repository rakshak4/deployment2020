/**
 * @description       : 
 * @author            : Sambhav Bholah
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Sambhav Bholah
**/
public with sharing class LWC02_VehicleController {
    @AuraEnabled(cacheable=true)

    public static List<Vehicle__c> getRelatedLoanedVehicles(Id recordId){

        List<Case> lstCurrentCase = [SELECT  LoanToVehicle__c FROM Case WHERE Id =: recordId];
        
        List<Vehicle__c> lstVehicleLoaned = [SELECT Make__c, 	Model__c, LoanEndDate__c FROM Vehicle__c WHERE Id =: lstCurrentCase[0].LoanToVehicle__c];
        system.debug('this is loaned vehicle' + lstVehicleLoaned);
        
        return lstVehicleLoaned;
    }


    public static List<Case> terminateLoan(ID recordId){
        List<Case> lstCurrentCase = [SELECT LoanToVehicle__c FROM Case WHERE Id =: recordId];
        return lstCurrentCase;
        // List<Vehicle__c> lstVehicle = [SELECT Id, LoanEndDate__c FROM Vehicle__c WHERE Id =: lstCurrentCase[0].LoanToVehicle__c];
        // system.debug('before');
        // system.debug(lstVehicle);
        // for(Vehicle__c lstVehicle: veh){
        //     veh.LoanEndDate__c = NULL;
        // }

        // If(lstVehicle.size()>0){
        //     UPDATE lstVehicle
        // }

        //system.debug('after');
        //system.debug(lstVehicle);
        //return lstVehicle;
    }

}