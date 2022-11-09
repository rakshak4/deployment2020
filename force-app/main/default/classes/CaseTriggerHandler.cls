/**
 * @description       : Handler for Case Object
 * @author            : Kanigan Somadoo
 * @group             :
 * @last modified on  : 10-26-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author    Modification
 * 1.0   10-25-2022   KSO       Initial Version
 **/
public with sharing class CaseTriggerHandler {
    public void handleAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
        List<Case> lstCasPayment = new List<Case>();
        for (Case casNew : lstNewCas) {
            Case casOld = mapOldCas.get(casNew.Id);
            if (casOld.Status != casNew.Status && casNew.Status == 'Payment') {
                lstCasPayment.add(casNew);
            }
        }

        if(lstCasPayment.size() > 0){
            // Call create invoice method
            AP04_CreateInvoice.createInvoiceFromCase(lstCasPayment);
        }
    }


    public void handleBeforeInsertUpdate(List<Case> lstCasNew){

        // Filter all cases with loan Vehicle field not null
        
        List<Case> lstCasVehNotNull = new List<Case>();

        for(Case cas : lstCasNew){
            if(cas.LoanVehicle__c != null){
                lstCasVehNotNull.add(cas);
            }
        }


        if(lstCasVehNotNull.size() > 0) {
            //Call method with functionality to prevent insertion or update of case in filtered list
            AP07_preventUpsertOfCase.preventUpsert(lstCasVehNotNull);
        }


    }
}