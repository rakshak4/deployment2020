/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   10-25-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class AP07_PreventCaseOnLoanedVeh {
    /**
     * @description Method tdisplay error message when user tries to add an already loaned
     * vehicle to a case.
     * @author Dhomah Bhoovanyu | 25/10/2022
     * @return String The managed object's name.
     **/
    public static void PreventCaseOnLoanedVeh(List<Case> lstCas) {
        System.debug(lstCas[0].LoanedVehicle__c);

        Set<Id> setVehInputId = new Set<Id>();
        for(Case cse: lstCas){
            setVehInputId.add(cse.LoanedVehicle__c);
        }
        
        List<Vehicle__c> lstVeh = [SELECT Id FROM Vehicle__c WHERE status__c='Loaned' AND Id IN :setVehInputId];
        // for(Case cse : lstCas){
        //     lstVeh.add(cse.DamagedVehicle__c);
        // }
        // Set<Id> setVeh = new Set<Id>{lstVeh};
        // List<Case> lstCas2 = [SELECT Id, LoanedVehicle__c FROM Case WHERE LoanedVehicle__c IN :lstVeh];
        Set<Id> setAllVehLoaned = new Set<Id>();
        for(Vehicle__c veh: lstVeh){
            setAllVehLoaned.add(veh.Id);
        }
        
        System.debug('SEt>>>'+setAllVehLoaned);
        // System.debug(lstCas2[0].status__c);Set<Integer> s1 = new Set<Integer>(ls);
        for(Case cas : lstCas){
            System.debug('Damaged vehicle>>>'+cas.LoanedVehicle__c);
            // System.debug(cas.status__c);
            if(setAllVehLoaned.contains(cas.LoanedVehicle__c)){
                cas.addError('Cannot assign vehicle that is already on loan');
            }
        }
    }
}