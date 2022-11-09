/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : As an agent, i want an invoice to be created after a claim has been processed so as to issue payment to the customer
 * @Author             : Narmeen Nehor
 * @Group              :
 * @Last Modified By   : Narmeen Nehor
 * @Last Modified On   : 25/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      SNA      Initial Version
 **/

public with sharing class CaseTriggerHandler {
  public void handleAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
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
}