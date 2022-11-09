/**
 * @description       :
 * @author            : Ashita Gopaul
 * @group             :
 * @last modified on  : 10-26-2022
 * @last modified by  : Ashita Gopaul
 **/
public with sharing class AP04_PreventCreationOfCase {
    public static void preventCreation(List<Case> lstCasVeh) {
        if (lstCasVeh.size() > 0) {
            List<Id> lstVehIds = new List<Id>();

            for (Case cas : lstCasVeh) {
                lstVehIds.add(cas.LoanedVehicle__c);
            }

            Map<Id, Vehicles__c> mapVeh = new Map<Id, Vehicles__c>([SELECT status__c FROM Vehicles__c WHERE status__c = 'loaned' AND Id IN :lstVehIds]);

            for (Case cas : lstCasVeh) {
                if (mapVeh.containsKey(cas.LoanedVehicle__c)) {
                    cas.addError('Cannot assign vehicle that is already on loan');
                }
            }
        }
    }
}