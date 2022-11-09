/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-26-2022   Keny Poisson   Initial Version
**/
public with sharing class AP07_ErrorMessage {
    

    public static void sendErrorMessage(List<invoice__c> lstInvoice){

        for (invoice__c inv: lstInvoice){
            
            inv.addError('Cannot delete invoice before last payment date');
        }

    }


    public static void sendErrorMessageForCase(List<Case> lstVehicleOnCase){

        for (Case Cas : lstVehicleOnCase){

            Cas.addError('Vehicle already on loan cannot be assign to a case');

        }


    }
}