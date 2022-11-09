/**
 * @description       : Checks the status of the vehicle entered and prevents assigning it to the case if
 *                      it is already loaned.
 * @author            : Rayhaan Beeharry
 * @group             :
 * @last modified on  : 10-26-2022
 * @last modified by  : Rayhaan Beeharry
 **/
public with sharing class AP06_PreventAddingVehicleOnLoan {
    public static void preventAddingVehicle(List<Case> lstCas) {
        Set<Id> setVehId = new Set<Id>();
        for (Case cas : lstCas) {
            setVehId.add(cas.LoanedVehicle__c);
        }
        List<Vehicles__c> lstLoanedVehicles = [
            SELECT Id
            FROM Vehicles__c
            WHERE Id IN :setVehId AND status__c = 'loaned'
        ];

        Set<Id> setLoanedVehicles = new Set<Id>();
        for (Vehicles__c veh : lstLoanedVehicles) {
            setLoanedVehicles.add(veh.Id);
        }

        for (Case cas : lstCas) {
            if (setLoanedVehicles.contains(cas.LoanedVehicle__c)) {
                cas.addError('Cannot assign vehicle that is already on loan');
            } else {
                setLoanedVehicles.add(cas.LoanedVehicle__c);
            }
        }

        // Map<Id,List<Case>> mapVehIdCases= new Map<Id,List<Case>>();
        // for(Case cas : lstCas){
        //     Id vehId= cas.LoanedVehicle__c;
        //     if(mapVehIdCases.containsKey(vehId))
        //         mapVehIdCases.get(vehId).add(cas);
        //     else 
        //         mapVehIdCases.put(vehId, new List<Case>());
        // }
        // List<Vehicles__c> lstLoanedVehicles = [SELECT Id
        //                                      FROM Vehicles__c
        //                                      WHERE Id IN :mapVehIdCases.keySet() AND status__c = 'loaned' ];
        // for()
    }
}