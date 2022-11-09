/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : Case study 4: As an agent, i should not be able to create/update
 *                                   a case on a vehicle that is already on loan
 * @Author             : MJH (Spoon Consulting)
 * @Group              :
 * @Last Modified By   : Mehreen Jhummun
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    26-10-2022, 10:09:30             MJH      Initial Version
 **/
public with sharing class AP004_PreventUpdateInsertCase4 {
    public static void CannotAssignVehicleLoaned(List<Case> lstCas) {
        Set<Id> setId = new Set<Id>();

        for (Case vehID : lstCas) {
            setId.add(vehID.LoanedVehicle__c);
        }
        List<Vehicle__c> lstId = new List<Vehicle__c>();

        lstId = [SELECT Id FROM Vehicle__c WHERE id IN :setId AND Status__c = 'loaned'];

        // to avoid duplicate ID, met li dans un set et aussi pour servi enbas 
        Set<Id> setVehLoaned = new Set<Id>();
        for (Vehicle__c vehIDLoaned : lstId) {
            setVehLoaned.add(vehIDLoaned.Id);
        }

       
        for (Case casNew : lstCas) {
           
            if (setVehLoaned.contains(casNew.LoanedVehicle__c)) {
                casNew.adderror('Cannot assign vehicle that is already on loan');
            }
        }
    }
}