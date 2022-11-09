/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 10-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
/**
 * @File Name          : AP02_ParameterExercise.cls
 * @Description        : Initialisation with VSCode
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-20-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0       20/10/22                    AGH       Initial Version
 **/
public with sharing class AP02_ParameterExercise {

    
        /**
        * @description Method that takes as input String color and query the selected fields. Colour should match with the one in the parameter
        * @author Asma Ghanty | 19/10/22
        * @return String The managed object's name.
        **/
        public static void colourMatchVehicle(String color){
            
            List<Vehicles__c> listVehicle = [SELECT Colour__c, Make__c, Model__c, Mileage__c FROM Vehicles__c WHERE Colour__c =: color];


            if (listVehicle.size()>0){
            
                System.debug(listVehicle);
            
            }
          
        }

        /**
        * @description Method that takes as input String color and using Set to assign 2 colours.
        * @author Asma Ghanty | 19/10/22
        * @return String The managed object's name.
        **/

        public static void vehColour(String color){
            Set<String> set1 = new Set <String>{'Red', 'Blue'};
            List<Vehicles__c> lstVehicle = [SELECT Colour__c, Make__c, Model__c, Mileage__c FROM Vehicles__c WHERE Colour__c IN: set1];

            if (lstVehicle.size()>0){
           
                System.debug(lstVehicle);
            
        }

        }

        public static void mapExercise(){
            Map<string, String> mapRegNumMake = new Map<string, String>();

            //add items
            mapRegNumMake.put('12 JN 94', 'Toyota Glanza');
            mapRegNumMake.put('78 0C 98', 'Toyota Supra');
            mapRegNumMake.put('1 JN 22', 'BMW X6 M');
            mapRegNumMake.put('678 DC 00', 'Honda Civic EK3');

            //print the values
            System.debug('My Cars and their make: mapRegNumMake:' +mapRegNumMake);

            //print map size
            System.debug('Map Size: mapRegNumMake' +mapRegNumMake.size());
        }

        public static void mapGetColour(){

            //creating a set and adding a list into it. Both Key(color) and Value(Name) is type string
            Map<string, List<String>> mapColour = new Map<string, List<String>>();
            
            mapColour.put('Black', new List<String>{'Testing', 'op'});
            mapColour.put('Red', new List<String>{'bhav', 'testing'});

            if (mapColour.containsKey('Black')){

            System.debug('Happy employees wearing Black:' +mapColour.get('Black'));
        }
    

    if (mapColour.containsKey('Red')){

        System.debug('Happy employees wearing Red:' +mapColour.get('Red'));
    }
    //returns all colours from the map
System.debug('Different colours:' +mapColour.keySet());

//to display all key and its values from the map
System.debug('All SUPER HAPPY employee names:' +mapColour.Values());

Integer numOfEmployees = 0;

for (String colour : mapColour.keySet()){

    //mapColor.get(colour) returns a list of EXTREMELY happy employees wearing color x
    numOfEmployees += mapColour.get(colour).Size();
}

System.debug('Number of extremely happy employees:' +numOfEmployees);


}


}