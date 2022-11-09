/**
 * @description       : Handler for CaseTrigger.
 * @author            : Asma Ghanty
 * @group             :
 * @last modified on  : 11-07-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-25-2022   Asma Ghanty   Initial Version
 **/
public with sharing class CaseTriggerHandler {
 

    /**
     * @description Method that query all accts where Region != Null. Build a map of Region and lst of Accts
     * @author Asma Ghanty | 20/10/22
     * @return Map.
     **/
    public void handleAfterUpdate(List<Case> lstNewCase, Map<Id, Case> mapOldCase) {
        List<Invoices__c> lstInvoice = new List<Invoices__c>(); //list to create invoice
        List<Case> lstCaseUpdate = new List<Case>();
        for (Case casNew : lstNewCase) {
            //getting all the records for an specific old case
            Case caseRecOld = mapOldCase.get(casNew.id);

            if (casNew.Status != caseRecOld.Status) {
                if (casNew.Status == 'Payment') {
                    lstCaseUpdate.add(casNew);
                }
            }
        }
        if (lstCaseUpdate.size() > 0) {
            AP01_CreateInvoice.createInvoiceFromCase(lstCaseUpdate);
        }
    }
    /**
     * @description prevent insert if loaned vehicle already loaned
     * @author Asma Ghanty | 10-26-2022
     * @param List<Case> lstCasBeforeInsUpd
     * @return public
     **/
    public void handlerBeforeInsert(List<Case> lstCasBeforeInsert) {
        List<Case> lstCasLoanedVehOld = new List<Case>();
        for (Case cas : lstCasBeforeInsert) {
            if (cas.LoanedVehicle__c != null) {
                lstCasLoanedVehOld.add(cas);
            }

        }
  

        if (lstCasBeforeInsert.size() > 0) {
            AP04_CasePreventInsUpdate.PreventInsUpdLoanedVeh(lstCasLoanedVehOld);

        }
    }

    //prevent update if loaned vehicle already loaned
    public void handlerBeforeUpdate(List<Case> lstCasBeforeUpdate) {
        List<Case> lstCasLoanedVehicleNew = new List<Case>();
        for (Case cas : lstCasBeforeUpdate) {
            if (cas.LoanedVehicle__c != null) {
                lstCasLoanedVehicleNew.add(cas);
            }
        }
        if (lstCasBeforeUpdate.size() > 0) {
            AP04_CasePreventInsUpdate.PreventInsUpdLoanedVeh(lstCasLoanedVehicleNew);
        }
    }

 
}