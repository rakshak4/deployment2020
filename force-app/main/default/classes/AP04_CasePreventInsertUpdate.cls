/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 10-30-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   10-26-2022   Bhavish Nundoo   Initial Version
**/
public with sharing class AP04_CasePreventInsertUpdate {
    
    public static void CheckIfLoanVehicle(List<Case> lstCasVeh){
        Set<Id> setVehId = new Set<Id>();
        for (Case cas : lstCasVeh) {
            setVehId.add(cas.LoanedVehicle__c);
        }
        
        List<Vehicle__c> lstVehicleStatus = [SELECT Id, status__c FROM Vehicle__c WHERE Id IN :setVehId];

        //Map that contains vehicle id as key and vehicle status as valuee
        Map<Id, Vehicle__c> mapVehStatus = new Map<Id, Vehicle__c>(lstVehicleStatus);

        for (Case cas : lstCasVeh) {
            //Check if vehicle status is equal to loaned

            if (mapVehStatus.get(cas.LoanedVehicle__c).status__c=='Loaned') {
                cas.addError('Cannot assign vehicle that is already on loan');
            }
        }

        // List<Case> lstCas = [SELECT Id, LoanedVehicle__c, LoanedVehicle__r.status__c FROM Case WHERE LoanedVehicle__c != Null AND LoanedVehicle__c =:lstCasVeh];

        // if (lstCas.size()>0) {
        //     for (Case cas : lstCas) {
        //         if(cas.LoanedVehicle__r.status__c == 'Loaned'){
        //             cas.addError('Cannot assign vehicle that is already on loan');
        //         }
                
        //     }
        // }
        
    }
}