/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : As an agent, i want an invoice to be created after a claim has
 *                       been processed so as to issue payment to the customer
 * @Author             : Souhayl Johar
 * @Group              :
 * @Last Modified By   : Souhayl Johar
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      <SJO>      Initial Version
 **/

public with sharing class CaseTriggerHandler {
    /*public void handleAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {    <<<<<<not optimised>>>>>>
    List<Invoice__c> lstInvoice = new List<Invoice__c>();

    for (Case casNew : lstNewCas) {
      Case caseRecOld = mapOldCas.get(casNew.id);

      if (casNew.Status != caseRecOld.Status) {
        if (casNew.Status == 'Payment') {
          Invoice__c inv = new Invoice__c();

          inv.Account__c = casNew.AccountId;
          inv.Contact__c = casNew.ContactId;
          lstInvoice.add(inv);
        }
      }
    }

    if (!lstInvoice.isEmpty()) {
      insert lstInvoice;
    }
  }
} */

    public void handlerAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
        // List<Invoice__c> lstInvIns = new List<Invoice__c>();
        List<Case> lstCasUpt = new List<Case>();
        for (Case casNew : lstNewCas) {
            Case caseRecOld = mapOldCas.get(casNew.Id);
            if (casNew.Status != caseRecOld.Status && casNew.Status == 'Payment') {
                lstCasUpt.add(casNew);
                // Invoice__c inv = new Invoice__c();
                // inv.Account__c = casNew.AccountId;
                // inv.Contact__c = casNew.ContactId;
                // inv.Case__c = casNew.Id;
                // inv.LastPaymentDate__c = System.today().addMonths(3);
                // lstInvIns.add(inv);
            }
        }
        //  }
        // if (lstInvIns.size() > 0) {
        // insert lstInvIns;

        //System.debug(lstInvIns);
        //}
        if (lstCasUpt.size() > 0) {
            AP01_CreateInvoice.createInvoiceFromCase(lstCasUpt);
        }
    }

    public void handleBeforeInsertAndUSpdate(List<Case> lstCse){

        List<Case> lstCseWithLoanedVeh = new List<Case>();
        System.debug('waaaa');
        for (Case Cse : lstCse){
            if (Cse.LoanedVehicle__c != null) {
                lstCseWithLoanedVeh.add(Cse);
            }
        }
        if(lstCseWithLoanedVeh.size()>0){
        AP04_CreateAndUpdateCase.CheckLoanedVehicleStatus(lstCseWithLoanedVeh);
        }
        
    }


}