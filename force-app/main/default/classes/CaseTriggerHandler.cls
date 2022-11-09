/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : Handler for the trigger on Case/Claim
 * @Author             : <Company Name>
 * @Group              :
 * @Last Modified By   : Rayhaan Beeharry
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    DD-MMM-YYYY, HH:MM:SS      RBE      Initial Version
 **/

public with sharing class CaseTriggerHandler {
    public void handleAfterUpdate(List<Case> lstCasNew, Map<Id, Case> mapCasOld) {
        // if(!checkIfAgent())
        //     return;
        List<Case> lstCasToUse = new List<Case>();

        // get Cases where status was changed to Payment
        for (Case cas : lstCasNew) {
            Case caseRecOld = mapCasOld.get(cas.Id);
            if (cas.Status != caseRecOld.Status) {
                if (cas.Status == 'Payment') {
                    lstCasToUse.add(cas);
                }
            }
        }
        if (lstCasToUse.size() == 0) {
            return;
        }
        AP03_CreateInvoice.createInvoice(lstCasToUse);
    }

    public void handleBeforeInsertUpdate(List<Case> lstCasNew) {
        // if(!checkIfAgent())
        //     return;
        List<Case> lstCasToUse = new List<Case>();
        for (Case cas : lstCasNew) {
            if (cas.LoanedVehicle__c != null) {
                lstCasToUse.add(cas);
            }
        }
        if (lstCasToUse.size() > 0)
            AP06_PreventAddingVehicleOnLoan.preventAddingVehicle(lstCasToUse);
    }

    public static Boolean checkIfAgent() {
        String profileName = [SELECT Name FROM Profile WHERE Id = :UserInfo.getProfileId()][0].Name;
        Boolean isAgent;
        return profileName == 'Agent';
    }
}