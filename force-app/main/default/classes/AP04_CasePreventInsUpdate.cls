/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-26-2022   Asma Ghanty   Initial Version
**/
public with sharing class AP04_CasePreventInsUpdate {
    public AP04_CasePreventInsUpdate() {

    }
    /**
    * @description 
    * @author Asma Ghanty | 10-26-2022 
    * @param List<Case> lstCasVeh 
    **/
    public static void PreventInsUpdLoanedVeh(List<Case>lstCasVeh){

        
        System.debug('lstCasVehBeforeQuery:' +lstCasVeh);
        List<Case> lstCasLoanedVehicle = new List<Case>([SELECT Id, LoanedVehicle__c FROM Case 
        WHERE LoanedVehicle__c !=null AND LoanedVehicle__r.Status__c = 'loaned']);

        System.debug('lstCasVehAfterQuery:' +lstCasLoanedVehicle);

        for(Case cas: lstCasVeh){
            if(cas.LoanedVehicle__r.Status__c=='loaned'){
                cas.addError('Cannot create/update an already loaned vehicle');
            }
        }



    }
}