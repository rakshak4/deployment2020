/**
 * @File Name          : AP02_Vehicles.cls
 * @Description        : Apex basics and database day 2
 * @Author             : <Company Name>
 * @Group              : 
 * @Last Modified By   : RBE
 * @Last Modified On   : 10-20-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    DD-MMM-YYYY, HH:MM:SS      RBE      Initial Version
**/

public with sharing class AP02_Vehicles {
    /**
     * @description Get all Vehicles having the color passed as parameter
     * @author Rayhaan Beeharry | 10/20/2022
     * @return void.
     **/
    public static void getVehiclesByColor(String color){
        if(String.isBlank(color)){            
            System.debug('No color was specified');
            return;
        }

        List<Vehicles__c> lstVeh= [SELECT Make__c,Model__c,Mileage__c FROM Vehicles__c WHERE Colour__c=: color];
        if(lstVeh.size()==0){
            System.debug('No vehicles were found');
            return;
        }

        for(Vehicles__c v: lstVeh){
            System.debug('Make: '+v.Make__c+' Model: '+v.Model__c+' Mileage: '+v.Mileage__c);
        }        
    }

     /**
     * @description Get all Vehicles having the colors passed as parameter, using a set
     * @author Rayhaan Beeharry | 10/20/2022
     * @return void.
     **/
    public static void getVehiclesSetColor(String col1, String col2){
        Set<String> setColours= new Set<String>();
        setColours.add(col1);
        setColours.add(col2);

        List<Vehicles__c> lstVeh= [SELECT Make__c,Model__c,YearOfVehicle__c FROM Vehicles__c WHERE Colour__c IN :setColours];
        if(lstVeh.size()==0){
            System.debug('No vehicles were found');
            return;
        }

        for(Vehicles__c v: lstVeh){
            System.debug('Make: '+v.Make__c+' Model: '+v.Model__c+' Year of Vehicle: '+v.YearOfVehicle__c);
        }        
    }

    public static void mapExample(){
        Map<String,String> mapRegNumMake= new Map<String,String> ();

        mapRegNumMake.put('12 JN 94','Toyota Glanza');
        mapRegNumMake.put('78 OC 98','Toyota Supra');
        mapRegNumMake.put('1 JN 22','BMW X5 M');
        mapRegNumMake.put('758 OC 00','Honda Civic EK3');

        System.debug('My Cars and their Make: '+ mapRegNumMake);
        System.debug('Map Size: '+mapRegNumMake.size());
    }

    public static void mapExample2(String colour){
        List<String> lstEmployees= new List<String>();
        lstEmployees.add('John');
        lstEmployees.add('Tom');
        lstEmployees.add('Jane');

        List<String> lstEmployees2= new List<String>();
        lstEmployees2.add('Paul');
        lstEmployees2.add('Sarah');
        lstEmployees2.add('Jim');

        Map<String,List<String>> mapClothesColourEmployees= new Map<String, List<String>>();
        mapClothesColourEmployees.put('Blue', lstEmployees);
        mapClothesColourEmployees.put('Red', lstEmployees2);
        //String colour='Red';
        if(mapClothesColourEmployees.containsKey(colour)){
            System.debug('Clothes color  and employee names: '+ mapClothesColourEmployees.get(colour));
            System.debug('Clothes colors: '+ mapClothesColourEmployees.keySet());
            System.debug('Employee names: '+ mapClothesColourEmployees.values());
        }
        Integer numEmployees=0;
        for(String col:mapClothesColourEmployees.keySet()){
            numEmployees+= mapClothesColourEmployees.get(col).size();
        }
        System.debug(numEmployees);

        // numEmployees=0;
        // for(List<String> emps: mapClothesColourEmployees.values()){
        //     numEmployees+=emps.size();
        // }
        // System.debug(numEmployees);
    }
    
    
}