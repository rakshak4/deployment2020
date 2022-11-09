/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Jason Ramjaya
**/
public with sharing class LWC02_TerminateVehicleLoan {
    @AuraEnabled
    public static void updateVehicle(Vehicles__c vehToUpdate) {
        update vehToUpdate;
    }

    @AuraEnabled
    public static void updateCase(Case casToUpdate) {
        update casToUpdate;
    }
}