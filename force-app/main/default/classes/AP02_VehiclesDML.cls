/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AP02_VehiclesDML {

    /**
         * @description Method to select vehicle based on parameter color.
         * @author Keny Poisson | 20/10/2022
         * @return void
         **/
    

    public static void selectVehiles(String color){
        List <Vehicle__c> lstVehicles= new List <Vehicle__c>();
        lstVehicles=[SELECT Make__c,Model__c,Mileage__c FROM Vehicle__c WHERE Colour__c=:color];

        if (lstVehicles.size()>0){

            for(Vehicle__c veh: lstVehicles){
                System.debug(veh.Make__c);
                System.debug(veh.Model__c);
                System.debug(veh.Mileage__c);
            }

        }

    }

    public static void selectVehilesSets(){
        Set<String> set1 = new Set<String>{'Black', 'Red'};
        List <Vehicle__c> lstVehicles= new List <Vehicle__c>();
        lstVehicles=[SELECT Make__c,Model__c,Mileage__c FROM Vehicle__c WHERE Colour__c IN:set1];

        if (lstVehicles.size()>0){

            for(Vehicle__c veh: lstVehicles){
                System.debug(veh.Make__c);
                System.debug(veh.Model__c);
                System.debug(veh.Mileage__c);
            }

        }

    }


}