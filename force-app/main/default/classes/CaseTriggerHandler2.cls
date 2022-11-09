/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : <short description>
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : Sambhav Bholah
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-OCT-222, HH:MM:SS      SBH      Initial Version
 **/

public with sharing class CaseTriggerHandler2 {
    /**
     * @description       :
     * @author            : Sambhav Bholah
     * @group             :
     * @last modified on  : 10-26-2022
     * @last modified by  : Sambhav Bholah
     **/

    public void handleAfterUpdate(List<Case> lstNewCse, Map<Id, Case> mapOldCse) {

        List<Case> lstCsePayment = new List<Case>();
        for(Case cseNew: lstNewCse){
            Case cseOld = mapOldCse.get(cseNew.Id);

            if(cseNew.status != cseOld.status && cseNew.status == 'Payment'){
                lstCsePayment.add(cseNew);
            }
        }

        // if (lstCsePayment.Size() > 0) {
        //     AP01_CreateInvoice.createInvoiceFromCase(lstCsePayment);
        //     insert CsePayment;
        // }
      
    }

    public void handleBeforeInsert(List<Case> lstCase){
        List<Case> lstVehiclesLoaned = new List<Case>();
        
        for(Case cse: lstCase){
            if(cse.LoanToVehicle__c <> NULL){
                lstVehiclesLoaned.add(cse);
            }   
        }

        if(lstVehiclesLoaned.size() > 0 ){
            AP03_VehicleCheck.preventInsertAndUpdate(lstVehiclesLoaned);
        }
    }

    public void handleBeforeUpdate(List<Case> lstCase, Map<Id, Case> mapOldCse ){
        List<Case> lstVehiclesLoaned = new List<Case>();
        //Map<Id, Case> mapOldCse = new map<>();

        for(Case cse: lstCase){
            if(cse.LoanToVehicle__c != mapOldCse.get(cse.id).LoanToVehicle__c ){
                lstVehiclesLoaned.add(cse);
            }   
        }

        if(lstVehiclesLoaned.size() > 0 ){
            AP03_VehicleCheck.preventInsertAndUpdate(lstVehiclesLoaned);
        }
    }
}