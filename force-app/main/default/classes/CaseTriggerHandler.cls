/**
 * @File Name          : CaseTrigger.trigger
 * @Description        : <short description>
 * @Author             : Bhoovanyu Dhomah
 * @Group              :
 * @Last Modified By   : Bhoovanyu Dhomah
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, 10:09:SS      <BDH>      Initial Version
 **/
public with sharing class CaseTriggerHandler {
    public CaseTriggerHandler() {
    }
    /**
     * @description Method to identify the managed object.
     * @author Bhoovanyu Dhomah | 26/08/2021
     * @return String The managed object's name.
     **/
    public void handleAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
        List<Invoice__c> lstInv = new List<Invoice__C>();
        for (Case casNew : lstNewCas) {
            //put in a case instance if had to compare many fields
            Case caseRecOld = mapOldCas.get(casNew.Id);
            if (caseRecOld.Status != 'payment' && casNew.Status == 'Payment') {
                Invoice__C inv = new Invoice__c(
                    Account__c = casNew.AccountId,
                    Case__c = casNew.Id,
                    Contact__c = casNew.ContactId,
                    LastPaymentDate__c = casNew.CreatedDate.addMonths(3)
                );
                lstInv.add(inv);
                System.debug(inv);
            }
        }
        if (lstInv.size() > 0) {
            insert (lstInv);
        }
    }


    public void handleBeforeInsert(List<Case> lstCas){
        if(lstCas.size()>0){
            List<Case> lstCse = new List<Case>();
            for(Case cse : lstCas){
                if (cse.LoanedVehicle__c != null){
                    lstCse.add(cse);
                }
            }
            if(lstCse.size()>0){
                AP07_PreventCaseOnLoanedVeh.PreventCaseOnLoanedVeh(lstCse);
            }
            
        }
        
    }

    // public static void handleAfterUpdate(List<Case> lstCas){
    //     List<Case> lstCas2 = [SELECT ID, LoanedVehicle__c FROM Case WHERE Id IN :lstCas];
    //     AP07_PreventCaseOnLoanedVeh.AP07_PreventCaseOnLoanedVeh(lstCas2);
    // }
    
}