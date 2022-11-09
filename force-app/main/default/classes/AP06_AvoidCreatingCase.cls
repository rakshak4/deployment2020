/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-26-2022   Ayman Rummun   Initial Version
**/
public with sharing class AP06_AvoidCreatingCase {
    
    public static void checkBefInsertUpdate(List<Case> lstCas)
    {
        Set<String> setVehicleId = new Set<String>();
        Set<Id> setLoanedVehId = new Set<Id>();
        
        for(Case cas: lstCas)
        {
            setVehicleId.add(cas.VehicleId__c);
        }

        List<Vehicle__c> lstVeh = [SELECT Id, Status__c FROM Vehicle__c WHERE Id IN: setVehicleId AND Status__c ='Loaned'];

        for(Vehicle__c veh: lstVeh)
        {
           setLoanedVehId.add(veh.Id);         
        }

        System.debug(lstCas);


        for(Case cas: lstCas)
        {
            if(setLoanedVehId.contains(cas.vehicleId__c))
            {
                cas.addError('Cannot assign vehicle that is already on loan');
            }
        }
    }
}