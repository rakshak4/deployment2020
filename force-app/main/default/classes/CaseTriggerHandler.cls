/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : case study 1: Handler on As an agent, i want an invoice to be created
 *                       after a claim has been processed so as to issue payment to the customer
 *                        Case study 4: As an agent, i should not be able to create/update
 *                                       a case on a vehicle that is already on loan
 * @Author             : MJH (Spoon Consulting)
 * @Group              :
 * @Last Modified By   : Mehreen Jhummun
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, 10:09:30             MJH      Initial Version
 **/

public with sharing class CaseTriggerHandler {
    /**
     * @description Method to handle handler after update
     * @author Mehreen Jhummun | 25/10/2022
     * @return method handler
     **/
    /*  public void handleAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
        list<Invoice__c> lstInv = new List<Invoice__c>();
        for (
            Case casNew : lstNewCas //mo p loop dan new case
            ) {
            Case caseRecOld = mapOldCas.get(casNew.Id); //mo pou ggn mo case ki mon modifie
            //get record pou sa id la ki p store dan caseRecOld
            if (casNew.Status != caseRecOld.Status) {
                if (casNew.Status == 'Payment') {
                    Invoice__c inv = new Invoice__c(Account__c = casNew.AccountId, Case__c = casNew.Id, Contact__c = casNew.ContactId);
                    lstInv.add(inv);
                }
            }
        }
        if (lstInv.size() > 0) {
            insert lstInv;
        }
    }
    */

    /**
     * @description Method to handle handler after update
     * @author Mehreen Jhummun | 25/10/2022
     * @return method handler
     **/

    public void handleAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
        // handler logic
        List<Case> lstInv = new List<Case>();
        for (Case casNew : lstNewCas) {
            Case caseRecOld = mapOldCas.get(casNew.Id); // ggnr value de sa ID new case la, store li dans
            //caseRecOld instance
            if (casNew.Status != caseRecOld.Status && casNew.Status == 'Payment') {
                        lstInv.add(casNew);
                }
            
        }
        if (lstInv.size() > 0) {
            AP001_CreateInvoice.createInvoiceFromCase(lstInv);
        }
    }




    // public void handleBeforeUpdate(List<Case> lstCasNew, Map<Id, Case> mapOldCas) {
    //     List<Case> lstCasUpdate = new List<Case>();
    //     for (Case casNew : lstCasNew) {
           
    //         if (casNew.LoanedVehicle__c != NULL)
    //         {
    //             lstCasUpdate.add(casNew);
                
    //         }
    //         if (lstCasUpdate.size() > 0) {
    //             AP004_PreventUpdateInsertCase4.preventUpdateACase(lstCasUpdate);
    //         }
            
    //     }
    //     System.debug(lstCasUpdate);
    // }

    // public void handleBeforeInsert(List<Case> lstCasNew) {
    //     List<Case> lstCasInsert = new List<Case>();
    //     for (Case casNew : lstCasNew) {
    //         if (casNew.LoanedVehicle__c != NULL)
    //         {
    //             lstCasInsert.add(casNew);
    //         }
    //         if (lstCasInsert.size() > 0) {
    //             AP004_PreventUpdateInsertCase4.preventInsertACase(lstCasInsert);
    //         }
            
    //     }
    // }



    // public void handleBeforeUpdateOrInsert(List<Case> lstCaseNew) {
    //     //List<Case> lstCaseSelect = new List<Case>();

    //     Set<Id> setId = new Set<Id>();

    //     for (Case vehID : lstCaseNew) {
    //         setId.add(vehID.LoanedVehicle__c);
    //     }
    //     List<Vehicle__c> lstId = new List<Vehicle__c>();

    //     lstId = [SELECT Id FROM Vehicle__c WHERE id IN :setId AND Status__c = 'loaned'];

    //     Set<Id> setVehLoaned = new Set<Id>();
    //     for (Vehicle__c vehIDLoaned : lstId) {
    //         setVehLoaned.add(vehIDLoaned.Id);
    //     }

       
    //     System.debug('## set' + setId);
    //     for (Case casNew : lstCaseNew) {
    //         System.debug('## is true' + setVehLoaned.contains(casNew.LoanedVehicle__c));
    //         if (setVehLoaned.contains(casNew.LoanedVehicle__c)) {
    //             casNew.adderror('Cannot assign vehicle that is already on loan');
    //         }
    //     }
    // }




    public void handleBeforeUpdateInsert(List<Case> lstNewCas) {
        // handler logic
        List<Case> lstCas = new List<Case>();
        for (Case casNew : lstNewCas) {
            if (casNew.LoanedVehicle__c != null) {
                lstCas.add(casNew);
            }
        }
        if (lstCas.size() > 0) {
            AP004_PreventUpdateInsertCase4.CannotAssignVehicleLoaned(lstCas);
        }
    }
}