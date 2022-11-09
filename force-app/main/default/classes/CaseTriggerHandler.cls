/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : handler for CaseTrigger
 * @Author             : Bhavish Nundoo
 * @Group              :
 * @Last Modified By   : Bhavish Nundoo
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25/10/2022, HH:MM:SS      BNU      Initial Version
 **/
public with sharing class CaseTriggerHandler {
    public CaseTriggerHandler() {
    }

    /**
     * @description Method to create an invoice .
     * @author Bhavish Nundoo | 25/10/2022
     * @return String The managed object's name.
     **/
    public void handlerAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
        List<Invoice__c> lstInvIns = new List<Invoice__c>();
        List<Case> lstCasUpt = new List<Case>();
        for (Case casNew : lstNewCas) {
            Case caseRecOld = mapOldCas.get(casNew.Id);
            if (casNew.Status != caseRecOld.Status) {
                if (casNew.Status == 'Payment') {
                    lstCasUpt.add(casNew);
                    // Invoice__c inv = new Invoice__c();
                    // inv.Account__c = casNew.AccountId;
                    // inv.Contact__c = casNew.ContactId;
                    // inv.Case__c = casNew.Id;
                    // inv.LastPaymentDate__c = System.today().addMonths(3);
                    // lstInvIns.add(inv);
                }
            }
        }
        // if (lstInvIns.size() > 0) {
            // insert lstInvIns;
            
            //System.debug(lstInvIns);
        //}
        if (lstCasUpt.size()>0) {
            AP01_CreateInvoice.createInvoiceFromCase(lstCasUpt);
        }
        
    }
/**
     * @description Method to check if case is loaned or not  .
     * @author Bhavish Nundoo | 25/10/2022
     * @return String The managed object's name.
     **/
    public void handlerBeforeUpdate(List<Case> lstCasold){
        List<Case> lstCasWithLoanVeh = new List<Case>();
        
        for(Case cas: lstCasOld){
            if (cas.LoanedVehicle__c != null) {
                lstCasWithLoanVeh.add(cas);
            }

        }
        System.debug(lstCasWithLoanVeh);
        if (lstCasWithLoanVeh.size()>0) {
            AP04_CasePreventInsertUpdate.CheckIfLoanVehicle(lstCasWithLoanVeh);
        }

    }

    public void handlerBeforeInsert(List<Case> lstCasNew){
        List<Case> lstCasWithVeh = new List<Case>();
        
        for(Case cas: lstCasNew){
            if (cas.LoanedVehicle__c != null) {
                lstCasWithVeh.add(cas);
            }

        }
        System.debug(lstCasWithVeh);
        if (lstCasWithVeh.size()>0) {
            AP04_CasePreventInsertUpdate.CheckIfLoanVehicle(lstCasWithVeh);
        }

    }

}