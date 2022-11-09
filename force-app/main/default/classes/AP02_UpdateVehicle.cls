/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AP02_UpdateVehicle {


    public static void queryVehicleByColour(String colour){

        List<Vehicle__c> lstVehicle = [SELECT Make__c, Model__c, Mileage__C FROM Vehicle__c WHERE Colour__c =: colour ];

        if(lstVehicle.size() > 0){
            System.debug(lstVehicle);
        }
        else{
            System.debug('No records Available');
        }

    }

    public static void queryVehicleByColourUsingSet(){

        Set<String> setColour = new Set<String>{'White', 'Black'};

        List<Vehicle__c> lstVehicle = [SELECT Make__c, Model__c, Mileage__C FROM Vehicle__c WHERE Colour__c IN : setColour ];

        if(lstVehicle.size() > 0){
            System.debug(lstVehicle);
        }
        else{
            System.debug('No records Available');
        }

    }


    // USER STORY 1

    public static void vehicleGroupedByDamageType() {

        List<Case> lstVehicle = [SELECT DamagedVehicle__r.Make__c, DamageType__c FROM Case WHERE DamagedVehicle__c!=null ];

        System.debug(lstVehicle);

    }


}