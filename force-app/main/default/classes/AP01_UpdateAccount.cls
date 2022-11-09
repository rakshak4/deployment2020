/**
 * @File Name          : <AP01_UpdateAccount>.cls
 * @Description        : <Initialisation with VS Code>
 * @Author             : <Spoon Consulting>
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-20-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    19-10-2022, HH:MM:SS      <SNA>      Initial Version
**/

public with sharing class AP01_UpdateAccount {
    /**
     * @description Method to identify the managed object.
     * @author Rakshak Rajjoo | 26/08/2021
     * @return String The managed object's name.
     **/

     public static void UpdateAcc() {
        
        Account acct = new Account();
        acct.Name = 'Toto Polo';
        acct.BillingStreet = 'Royal Rd';
        acct.BillingCity = 'Moka';
        acct.BillingCountry = 'Mauritius';
        acct.Phone = '985632145';
        acct.Region__c = 'East';

        insert acct;
     }

     public static void UpdatePhone(){
        Account acct = new Account();
        acct.Id = '0017S00000FfeP7QAJ';
        acct.Phone = '12345678';

        update acct;
     }

     public static void DeleteRecord(){
        Account acct = new Account();
        acct.Id = '0017S00000FfeP7QAJ';

        delete acct;
     }

     public static void DisplayNames(){
        
        List<Account> lstAccName = [SELECT id, name FROM Account where region__c = 'North'];

        for(Account acc : lstAccName){
            System.debug(acc.Name);
        }

     }

     public static void insertMultipleAccounts(){
        List<Account> lstAcc = new List<Account>();

        String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();

        for(Integer i=0;i<10;i++){
           Account Acc1 = new Account(Name = 'NAME' + i, BillingStreet = 'TestTest', Region__c = 'North', RecordTypeId = recordTypeId);
           lstAcc.add(Acc1);
        }

        if(!lstAcc.isEmpty()){
            insert lstAcc;
        }

        List <Contact> lstContact = new List<Contact>();

        for(Account acc1 : lstAcc){
            Contact con = new Contact();
            con.AccountId = acc1.id;
            con.LastName = 'Nehor';
            con.Phone = '1234567';
            con.MailingStreet = 'Port Louis';
            lstContact.add(con);

        }
        if(!lstContact.isEmpty()){
            insert lstContact;
        }
    }

    public static void queryVehicles(String Color){

        List <Vehicle__c> lstVehicle = [SELECT Make__c, Model__c, Mileage__c FROM Vehicle__c WHERE Colour__c =: Color];
        System.debug(lstVehicle);

        if(!lstVehicle.isEmpty()){
            System.debug(lstVehicle);
        }

    }

    public static void queryVehiclesWithColors(){

        Set <String> setVehColors = new Set<String>{'Red', 'Black'};
        List<Vehicle__c> lstVeh = [SELECT Make__c, Model__c, Mileage__c, YearOfVehicle__c FROM Vehicle__c WHERE Colour__c IN: setVehColors];
         
        if(!lstVeh.isEmpty()){
            System.debug(lstVeh);
        }

    }

    public static void mapRegistrationNum(){
        Map<string,string> mapRegNumMake = new Map<string,string>();

        //add items
        mapRegNumMake.put('12 JN 94', 'Toyota Glanza');
        mapRegNumMake.put('78 OC 98', 'Toyota Supra');
        mapRegNumMake.put('1 JN 22', 'BMW X6 M');
        mapRegNumMake.put('678 DC 00', 'Honda Civic EK3');

        //print the values
        System.debug('My Cars and their make: mapRegNumMake: ' + mapRegNumMake);

        //print map size
        System.debug('Map Size: mapRegNumNake: ' + mapRegNumMake.size());
    }

    public static void mapClothesColor(){
        List<string> lstNames1 = new List<string>();
        List<string> lstNames2 = new List<string>();
        lstNames1.add('Narmeen');
        lstNames2.add('Salma');

        Map <string,List<String>> strMap = new Map <string,List<String>>();
            strMap.put ('Red', lstNames1);
            strMap.put ('Blue', lstNames2);

            // Print Values
            System.debug('My Happy Client: strMap: ' + strMap);

            if(strMap.containsKey('Red')){
                System.debug('Happy employees wearing red color: ' +strMap.get('Red'));
            }
            if(strMap.containsKey('Blue')){
                System.debug('Happy employees wearing Blue color: ' +strMap.get('Blue'));
            }

            //print all different keys
            System.debug('Different colors: ' + strMap.keySet());

            //print all employee names
            System.debug('All SUPER HAPPY employee names: ' + strMap.Values());

            // print map size
            System.debug('Map Size: strMap: ' + strMap.size());

            //Find total number of employees contained by the map
            Integer numOfEmployees = 0;

            for (String colour : strMap.keySet()){
                //mapStr.get(color) returns list of EXTREMELY happy employees wearing color x

                numOfEmployees += strMap.get(colour).size();

            }

            System.debug('Number of extremely happy employees: ' + numOfEmployees);
    }

    public static void storeCountryAndStates(){
        List<string> lstStates1 = new List<string>();
        List<string> lstStates2 = new List<string>();

        lstStates1.add('Connecticut');
        lstStates1.add('Nebraska');
        lstStates1.add('New Jersey');

        lstStates2.add('Berlin');
        lstStates2.add('Hamburg');

        Map<string, List<string>> mapCountryStates = new Map<string,List<string>>();
        mapCountryStates.put('United States', lstStates1);
        mapCountryStates.put('Germany', lstStates2);

        System.debug('Country and their states: ' +mapCountryStates);
    }

    public static void example3(){
        List<Account> lstAcc3= [SELECT Id, Name, region__c FROM Account WHERE Region__c != NULL];
        Map <string,List<Account>> mapAccount = new Map <string,List<Account>>();
        for(Account acc3 : lstAcc3 ){
            if(mapAccount.containsKey(acc3.Region__c)){
                mapAccount.get(acc3.Region__c).add(acc3);
            }
            else{
                mapAccount.put(acc3.Region__c, new List<Account>{acc3});
            }
        }

        System.debug('Account with specific region: : ' + mapAccount); 
        
    }
           
}