/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : Handler class for trigger on Case/Claims object
 * @Author             : Jason Ramjaya
 * @Group              :
 * @Last Modified By   : Jason Ramjaya
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022                    JRA         Initial Version
 **/
public with sharing class CaseTriggerHandler {
    /**
    * @description handler for after update of case trigger
    * @author Jason Ramjaya | 10-25-2022 
    * @param lstNewCase 
    * @param mapOldCase 
    **/
    public void handleAfterUpdate(List<Case> lstNewCase, Map<Id, Case> mapOldCase) {
        List<Case> lstCasPayment = new List<Case>();

        for (Case casNew : lstNewCase) {

            System.debug(casNew.LastModifiedBy.UserRole.DeveloperName);

            Case caseRecOld = mapOldCase.get(casNew.Id);
            if (caseRecOld.Status != casNew.Status) {
                if (casNew.Status == 'payment') {
                    lstCasPayment.add(casNew);
                }
            }
        }

        if (lstCasPayment.size() > 0)
            AP03_CreateInvoice.createInvoiceFromCase(lstCasPayment);
    }

    /**
    * @description handler for before of insert and update of case trigger
    * @author Jason Ramjaya | 10-25-2022 
    * @param lstCases 
    **/
    public void handleBeforeInsertUpdate(List<Case> lstCases) {
        List<Case> lstFilteredCases = new List<Case>();

        //filter out case without vehicle loaned
        for (Case cas : lstCases) {
            if (cas.LoanedVehicle__c != null){
                lstFilteredCases.add(cas);
            }
        }

        AP03_CreateInvoice.preventRentingLoanedVehicle(lstFilteredCases);
    }
}