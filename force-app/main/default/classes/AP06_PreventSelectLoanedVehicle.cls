/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 08/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   26/10/2022   Akhilesh Ramchurn   Initial Version
 **/
public with sharing class AP06_PreventSelectLoanedVehicle {
    public static void PreventCreateUpdateCaseOnLoanVehicle(List<Case> lstNewCse) {
        //retrieve cases where vehicle set to loan.
        // List<Case> lstCsePrevent = [SELECT LoanedVehicle__r.Status__c, LoanedVehicle__c FROM Case WHERE LoanedVehicle__r.Status__c ='loaned' ];

        // //set Id's of loaned vehicle
        // Set<Id> setVehicleId = new Set<Id>();
        // for(Case cse: lstCsePrevent){
        //     setVehicleId.add(cse.LoanedVehicle__c);
        // }

        // for(Case cse: lstNewCse){
        //   if(setVehicleId.contains(cse.LoanedVehicle__c)){
        //     cse.addError('Vehicle selected already on loan');
        //   }
        //   else{
        //     setVehicleId.add(cse.LoanedVehicle__c);
        //   }
        // }

        set<Id> setVehInList = new Set<Id>();
        for (Case cse : lstNewCse) {
            setVehInList.add(cse.LoanedVehicle__c);
        }
        System.debug(setVehInList);

        List<Vehicle__c> lstVehicle = [SELECT Id FROM vehicle__c WHERE Id IN :setVehInList AND Status__c = 'loaned'];

        System.debug(lstVehicle);

        Set<Id> setVehicleId = new Set<Id>();
        for (Vehicle__c veh : lstVehicle) {
            setVehicleId.add(veh.Id);
        }

        //List<Case> lstCsePrevent = [SELECT LoanedVehicle__r.Status__c, LoanedVehicle__c FROM Case WHERE LoanedVehicle__r.Status__c ='loaned' ];
        for (Case cse : lstNewCse) {
            if (setVehicleId.contains(cse.LoanedVehicle__c)) {
                cse.addError('Vehicle selected already on loan');
            } else {
                setVehicleId.add(cse.LoanedVehicle__c);
            }
        }
    }
}