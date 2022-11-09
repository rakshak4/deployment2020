/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 26/10/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   26/10/2022   Souhayl Johar   Initial Version
**/
public with sharing class AP04_CreateAndUpdateCase {
    public static void CheckLoanedVehicleStatus(List<Case> lstCasVeh) {

       

            List<Case> lstCas = [SELECT Id, LoanedVehicle__r.status__c FROM Case WHERE LoanedVehicle__c != Null AND Id =:lstCasVeh];
    
            for (Case cas : lstCas) {
                System.debug('vvvvvvvvvvv');
                if(cas.LoanedVehicle__r.status__c == 'Loaned'){
                    System.debug('qqqqqqqqqqqqqqqqqq');
                    cas.addError('Cannot assign vehicle that is already on loan');
                }
                
            }
        }

    }