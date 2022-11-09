/**
 * @description       : Handler for Trigger on claim object
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 08/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   25/10/2022   Akhilesh Ramchurn   Initial Version
 **/

public with sharing class CaseTriggerHandler {
    public void handleAfterUpdate(List<Case> lstNewCse, Map<Id, Case> mapOldCse) {
        List<Case> lstCastPayment = new List<Case>();
        for (Case cseNew : lstNewCse) {
            Case caseRecOld = mapOldCse.get(cseNew.Id);
            if (cseNew.Status != caseRecOld.Status) {
                if (cseNew.Status == 'Payment') {
                    lstCastPayment.add(cseNew);
                }
            }
        }

        if (lstCastPayment.size() > 0) {
            AP03_CreateInvoice.createInvoiceFromCase(lstCastPayment);
        }
    }

    public void handleBeforeCreateUpdate(List<Case> lstNewCse) {
        List<Case> lstCse = new List<Case>();
        for (Case cse : lstnewCse) {
            if (cse.LoanedVehicle__c <> null) {
                lstCse.add(cse);
            }
        }
        if (lstCse.size() > 0) {
            AP06_PreventSelectLoanedVehicle.PreventCreateUpdateCaseOnLoanVehicle(lstCse);
        }
    }
}