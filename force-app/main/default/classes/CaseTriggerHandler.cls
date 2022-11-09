/**
 * @description       : Logic for CaseTrigger
 * @author            : Keny Poisson
 * @group             :
 * @last modified on  : 10-26-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   10-25-2022   KPF    Initial Version
 **/

public with sharing class CaseTriggerHandler {
  /**
   * @description
   * @author Keny Poisson | 10-25-2022
   **/
  public void handleAfterUpdate(List<Case> lstCasNew, Map<Id, Case> mapCasOld) {
    List<Case> lstCasPayment = new List<Case>();
    for (Case casNew : lstCasNew) {
      //get case id from old record to be able to compare

      Case casOld = mapCasOld.get(casNew.Id);

      if (casNew.Status != casOld.Status && casNew.Status == 'Payment') {
        lstCasPayment.add(casNew);
      }
    }

    if (lstCasPayment.size() > 0) {
      AP05_CreateInvoice.CreateInvoiceFromCase(lstCasPayment);
    }
  }

  public void handleAfterInsertUpdate(List<Case> lstVehicleOnCase) {
    Set<Id> setVehicleId = new Set<Id>();
    //List<Case> lstCaseLoanNotNull=new List <Case>();

    for (Case Cas : lstVehicleOnCase) {
      if(Cas.LoanVehicle__c != null) {
        //lstCaseLoanNotNull.add(Cas);
        setVehicleId.add(Cas.LoanVehicle__c);
      }
    }

    List<Vehicle__c> lstWithVehicleOnLoan = [
      SELECT Id, status__c
      FROM Vehicle__c
      WHERE Id IN :setVehicleId AND status__c = 'Loaned'
    ];

    Map<Id, Vehicle__c> mapVehicleId = new Map<Id, Vehicle__c>(
      lstWithVehicleOnLoan
    );

    List<Case> lstCaseToAddError = new List<Case>();

    for (Case Cas :  lstVehicleOnCase) {
      if (mapVehicleId.containsKey(Cas.LoanVehicle__c)) {
        lstCaseToAddError.add(Cas);
      }
    }

    if (lstCaseToAddError.size() > 0) {
      //ap call

      AP07_ErrorMessage.sendErrorMessageForCase(lstCaseToAddError);
    }
  }
}