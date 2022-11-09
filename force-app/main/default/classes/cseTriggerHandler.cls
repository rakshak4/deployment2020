/**
 * @File Name          : CseTriggerHandler.cls
 * @Description        : Handler for trigger on case
 * @Author             : Ashita Gopaul
 * @Group              :
 * @Last Modified By   : Ashita Gopaul
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      <AGO>      Initial Version
 **/
public with sharing class cseTriggerHandler {
    public void handleAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
        List<Case> lstCasPayment = new List<Case>();

        for (Case casNew : lstNewCas) {
            Case caseRecOld = mapOldCas.get(casNew.id);
            if (casNew.Status != caseRecOld.Status) {
                if (casNew.Status == 'Payment') {
                    lstCasPayment.add(casNew);
                }
            }
        }
        if (lstCasPayment.size() > 0) {
            AP01_CreateInvoice.createInvoiceFromCase(lstCasPayment);
        }
    }

    public void handleBeforeInsertUpdate(List<Case> lstCas) {
        List<Case> lstCasVeh = new List<Case>();
        for (Case cas : lstCas) {
            if (cas.LoanedVehicle__c != null) {
                lstCasVeh.add(cas);
            }
        }
        if (lstCasVeh.size() > 0) {
            AP04_PreventCreationOfCase.preventCreation(lstCasVeh);
        }
    }
}