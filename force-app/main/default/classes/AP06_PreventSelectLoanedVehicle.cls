/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-26-2022   Chevish Boodhun   Initial Version
**/
public with sharing class AP06_PreventSelectLoanedVehicle {
    
    public static void preventCaseOnLoanedVehicle(List<Case> lstNewCse) {

        Set<Id> setVehInList = new Set<Id>();
        for (Case cse : lstNewCse) {
            setVehInList.add(cse.LoanedVehicle__c);
        }
        List<Vehicle__c> lstVehLoaned = [SELECT Id FROM Vehicle__c WHERE Status__c = 'Loaned' AND Id IN :setVehInList];
        Set<Id> setVehLoaned = new Set<Id>();
        for (Vehicle__c veh : lstVehLoaned) {
            setVehLoaned.add(veh.Id);
        }
        for (Case cse : lstNewCse) {
            if (setVehLoaned.contains(cse.LoanedVehicle__c)) {
                cse.addError('Cannot assign vehicle that is already on loan.');
            }
            else {
                setVehLoaned.add(cse.LoanedVehicle__c);
            }
        }

    }

}