/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : <short description>
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : Sambhav Bholah
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-OCT-222, HH:MM:SS      SBH      Initial Version
 **/
public with sharing class AP03_VehicleCheck {
    public static void preventInsertAndUpdate(List<Case> lstCase ) {

        Map<Id, Vehicle__c> mapAllVehicles = new map<Id, Vehicle__c>(); //to get ID and vehicle object

        List<Vehicle__c> lstVehiclesLoaned = [SELECT Id FROM Vehicle__c WHERE status__c = 'loaned'];
        //to get all vehicles loaned

        for(Vehicle__c veh: lstVehiclesLoaned){
            mapAllVehicles.put(veh.Id, veh);
            //to build the map
        }
        
        for(Case cse: lstCase){
            if(mapAllVehicles.containsKey(cse.LoanToVehicle__c)){
                cse.addError('Cannot assign vehicle that is already on loan');
            }
            
        }
        
    }
}