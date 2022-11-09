/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AP03_UsingMaps {
    
    public static void getEmployeeByColour(){
        Map<String, List<String>> mapColourEmp = new Map<String, List<String>>();
        mapColourEmp.put('Black', new List<String>{'Kanigan', 'Keny'});
        mapColourEmp.put('White', new List<String>{'Ashita', 'Shristi'});

        if(mapColourEmp.containsKey('Black')) {
            System.debug('Black Clothes '+mapColourEmp.get('Black'));
        }

        if(mapColourEmp.containsKey('Black')) {
            System.debug('White Clothes '+mapColourEmp.get('White'));
        }
    
    }

    public static void printAllColours() {

        // Map<String, List<String>> mapColourEmp = new Map<String, List<String>>();
        // mapColourEmp.put('Black', new List<String>{'Kanigan', 'Keny'});
        // mapColourEmp.put('White', new List<String>{'Ashita', 'Shristi'});

        //System.debug('All Colours ' + mapColourEmp.keySet());

        // print all Employees (Values in the map)

        //System.debug('All Employees ' + mapColourEmp.values());

    //     Integer numOfEmployees = 0;

    //     for(String colour : mapColourEmp.keySet()){
    //         numOfEmployees += mapColourEmp.get(colour).size(); 
    //     }

    //     System.debug('Number of Employees : ' + numOfEmployees);

    // }
    
    // Create a map to store country as Key and corresponding states as Values.
    // United States -> Connecticut , Nebraska, New Jersey
    // Germany -> Berlin, Hamburg

    Map<String, List<String>> mapCountryState = new Map<String,List<String>>();

    mapCountryState.put('United States', new List<String>{'Connecticut', 'Nebraska', 'New Jersey'});
    mapCountryState.put('Germany', new List<String>{'Berlin', 'Hamburg'});

    System.debug('Countries : ' + mapCountryState);

    }

    public static void queryAccountsWithRegion(){

        //Query list of accounts having value in region
        List<Account> lstAccounts = [SELECT Id,Region__c FROM Account WHERE Region__c!=null];

        //Instantiate a new map to store Region associated with accounts in that region 
        Map<String, List<Account>>  mapRegionAccount= new Map<String, List<Account>>();

        // Loop through list of accounts
        for(Account acc : lstAccounts) {

            // Check to see if map already has key for this account's region
            if(mapRegionAccount.containsKey(acc.Region__c)){

                mapRegionAccount.get(acc.Region__c).add(acc);
            }else {
                mapRegionAccount.put(acc.Region__c, new List<Account>{acc});
            }
        }

        System.debug(mapRegionAccount);

    }

}