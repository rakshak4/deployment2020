/**
 * @description       : Handler for the trigger on case object
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Chevish Boodhun   Initial Version
**/

public with sharing class CaseTriggerHandler {
    
    public void handleAfterUpdate(Map<Id, Case> mapOldCse, List<Case> lstNewCse) {

        List<Case> lstCsePayment = new List<Case>();
        for (Case cseRecNew : lstNewCse) {
            Case cseRecOld = mapOldCse.get(cseRecNew.Id);
            if (cseRecNew.Status != cseRecOld.Status) {
                if (cseRecNew.Status == 'Payment') {
                    lstCsePayment.add(cseRecNew);
                }
            }
        }

        if (lstCsePayment.size() > 0) {
            AP03_CreateInvoice.createInvoiceFromCase(lstCsePayment);
        }

    }

    public void handleBeforeInsert(List<Case> lstNewCse) {

        List<Case> lstCse = new List<Case>();
        for (Case newCse : lstNewCse) {
            if (newCse.LoanedVehicle__c != null) {
                lstCse.add(newCse);
            }
        }
        if (lstCse.size() > 0) {
            AP06_PreventSelectLoanedVehicle.preventCaseOnLoanedVehicle(lstCse);
        }

    }

    public void handleBeforeUpdate(Map<Id, Case> mapOldCse, List<Case> lstNewCse) {

        List<Case> lstCse = new List<Case>();
        for (Case newCse : lstNewCse) {
            Case oldCse = mapOldCse.get(newCse.Id);
            if (newCse.LoanedVehicle__c != null && oldCse.LoanedVehicle__c != newCse.LoanedVehicle__c) {
                lstCse.add(newCse);
            }
        }
        if (lstCse.size() > 0) {
            AP06_PreventSelectLoanedVehicle.preventCaseOnLoanedVehicle(lstCse);
        }

    }

}