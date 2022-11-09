/**
 * @File Name          : AP01_creatingClass.cls
 * @Description        : Yo this is a class, what does it do tho ?
 * @Author             : Spoon Consulting
 * @Group              : 
 * @Last Modified By   : SBH
 * @Last Modified On   : 19-OCT-2022, HH:MM:SS
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    19-OCT-2022, HH:MM:SS      SBH      Initial Version
**/
public with sharing class AP01_creatingClass {
    /**
    * @description to output my name
    * @author Sambhav Bholah | 19-OCT-2021
    * @return my name in string format
    **/
    public static void outputName(){
        system.debug('Sambhav...is hungry rn');
    }

    /**
    * @description creates an object of type Account and insert the details
    * @author Sambhav Bholah | 19-OCT-2021
    * @return void
    **/
    public static void insertAccountDetails(){
        Account acct = new Account(Name='Naruto');

        acct.Name = 'Toto Polo';
        acct.BillingStreet = 'Royal Rd';
        acct.BillingCity = 'Moka';
        acct.BillingCountry = 'Mauritius';
        acct.Phone = '985632145';
        acct.Region__c = 'East';
        
        INSERT acct;
    }

    /**
    * @description update an account who's name is Toto Polo
    * @author Sambhav Bholah | 19-OCT-2021
    * @return void
    **/
    public static void updateAccount(){
        String accId = [SELECT id FROM Account WHERE Name = 'Toto Polo'][0].Id;
        Account acct = new Account(Id = accId);
        //Account acct = '0017S00000GtdekQAB';
        acct.Phone = '748732857';
        UPDATE acct;
    }

    /**
    * @description deletes an account who's name is Toto polo
    * @author Sambhav Bholah | 19-OCT-2021
    * @return void
    **/
    public static void deleteAccount(){
        String accId = [SELECT id FROM Account WHERE Name = 'Toto Polo'][0].Id;
        Account acct = new Account(Id = accId);
        DELETE acct;
    }

    /**
    * @description search all accounts who's region is north
    * @author Sambhav Bholah | 19-OCT-2021
    * @return void
    **/
    public static void searchAccountDetails(){
        //bring all account where region is north, then debug all the names
        //List<String> temp = new List<String>();
        List<Account> acct = [SELECT Name FROM Account WHERE Region__c= 'North'];
        
        system.debug('List of account names where region is north');

        for(Account account : acct){
            system.debug('Account name is ' + account.Name);
        }
    }


    /**
    * @description for each account inserted, it creates a respective contact
    * @author Sambhav Bholah | 19-OCT-2021
    * @return void
    **/
    public static void bulkUpdate(){
        //Insert 10 accounts (RecordType: Customer and all the required fields need to be filled) 
        //and for each account, insert a contact (
        //Address and phone must contain the same corresponding data as the account).
        //Note: RecordTypeId must not be hardcoded
        List<Account> lstAccounts = new List<Account>();
        List<Contact> lstContacts = new List<Contact>();

        String RecordTypeID = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        // to get the record type ID, always do this

        for(Integer i = 0; i < 10; i++){

            Account acct = new Account();
            acct.Name = 'MR Numeros ' + i;
            acct.BillingStreet = 'Royal Rd';
            acct.BillingCity = 'Moka';
            acct.BillingCountry = 'Mauritius';
            acct.Phone = '985632145';
            acct.Region__c = 'East';
            acct.RecordTypeId =  RecordTypeID;

            lstAccounts.add(acct);
        }

        if (lstAccounts.size() > 0 ){
            INSERT lstAccounts;
        }
        
        for(Account newAccs : lstAccounts){
            //contact required stuff are: LastName, AccountName & Phone
            Contact conc = new Contact();
            conc.AccountId = newAccs.Id;
            conc.LastName = 'Mrs Numeros';
            conc.Phone = '985632145';
            //conc.OtherAddress = 'Moka';
            lstContacts.add(conc);
        }

        if (lstAccounts.size() > 0 ){
            INSERT lstContacts;
        }
    }

    //Insert 10 accounts (RecordType: Customer and all the required fields need to be filled) 
    //and for each account, insert a contact (
    //Address and phone must contain the same corresponding data as the account).
    //Note: RecordTypeId must not be hardcoded

    /**
    * @description search a vehicle by input its color and returns make, model and milleage
    * @author Sambhav Bholah | 20-OCT-2021
    * @return void
    **/
    public static void searchVehicles(String colorInput){
        String color = colorInput;
        List<Vehicle__c> vehi = [SELECT Make__c, Mileage__c, Model__c FROM Vehicle__c WHERE Colour__c =: color];
        if (vehi.Size() > 0 ){
            system.debug('List of vehicles whose color is ' + color);

            //for each LIST, loop thru ELEMENT, 
            //for(LIST x: element) where x is the values we need inside

            for(Vehicle__c veh : vehi){
                system.debug('Vehicle make is ' + veh.Make__c);
                system.debug('Vehicle model is ' + veh.Model__c);
                system.debug('Vehicle milleage is ' + veh.Mileage__c);
            }
        }
    }


    /**
    * @description search a vehicle by two color set, using sets
    * @author Sambhav Bholah | 20-OCT-2021
    * @return void
    **/
    public static void setFirstExample (){

        Set<String> color = new Set<String>{'Red', 'White'};

        List<Vehicle__c> vehi = [SELECT Make__c, Mileage__c, Model__c FROM Vehicle__c WHERE Colour__c IN: color];

        if (vehi.Size() > 0 ){
            system.debug('List of vehicles whose color is ' + color);

            //for each LIST, loop thru ELEMENT, 
            //for(LIST x: element) where x is the values we need inside

            for(Vehicle__c veh : vehi){
                system.debug('Vehicle make is ' + veh.Make__c);
                system.debug('Vehicle model is ' + veh.Model__c);
                system.debug('Vehicle milleage is ' + veh.Mileage__c);
            }
        }
    }
//----------------------------------------MAP------------------------------------------------------
    /**
    * @description insert values in vehicles via MAP
    * @author Sambhav Bholah | 20-OCT-2021
    * @return void
    **/
    public static void mapFirstExample(){

        Map<String, String> mapRegNumMake = new map<String, String>();

        //add items
        mapRegNumMake.put('12 JN 94', 'Toyota Glanza');
        mapRegNumMake.put('12 JN 95', 'Toyota Supra');
        mapRegNumMake.put('1 JN 22' , 'Nissa Silvia');
        mapRegNumMake.put('12 DEC 00', 'Honda Civic EK3');

        //print the values
        System.debug('My Cars and their make: mapRegNumMake: '+ mapRegNumMake);

        //print the map size
        System.debug('Map size : mapRegNumMake: '+ mapRegNumMake.size());
    }

    /**
    * @description insert values in vehicles via MAP
    * @author Sambhav Bholah | 20-OCT-2021
    * @return void
    **/
    public static void mapSecondExample(){
        //map with key color

        List<String> lstEmployeeNames = new List<String>();
        lstEmployeeNames.add('Naruto');
        lstEmployeeNames.add('Sasuke');
        lstEmployeeNames.add('Madara');
        lstEmployeeNames.add('Minato');

        Map<String, List<String> > mapColorMake = new map<String, List<String> >();

        //add items
        //mapColorMake.put('Black', lstEmployeeNames);
        //mapColorMake.put('Red', lstEmployeeNames);

        //2nd way kishan
        mapColorMake.put('Black', new List<String>{'test','test2'});
        mapColorMake.put('Red',new List<String>{'test3','test4'});

        //print the values
        //System.debug('My Cars and their make: mapRegNumMake: '+ mapColorMake);

        //print the map size
        //System.debug('Map size : mapRegNumMake: '+ mapColorMake.size());

        //❗❗to check if the map contains the key
        // Boolean contains = mapColorMake.containsKey('Black');
        // if (contains = true) {
        //     System.debug('msg ' + mapColorMake.get('Black'));
        // }
        
        // if (mapColorMake.containsKey('Red')) {
        //     System.debug('msg ' + mapColorMake.get('Black'));
        // }

        //❗key set
        //system.debug('Different colors: '+ mapColorMake.keySet());
        
        //❗all values
        //system.debug('Different colors: '+ mapColorMake.values());

        Integer numOfEmployees = 0;
        for(String colour: mapColorMake.keySet()){
            numOfEmployees += mapColorMake.get(colour).Size();

        }
        system.debug('Number of extremely happy employees '+ numOfEmployees);

    }

    public static void country(){
        // Create a map to store country as Key and corresponding states as Values.
        // United States -> Connecticut , Nebraska, New Jersey
        // Germany -> Berlin, Hamburg

        Map<String, List<String> > mapCountry = new map<String, List<String> >();

        mapCountry.put('United States', new List<String>{'Connecticut',' Nebraska','New Jersey'});
        mapCountry.put('Germany',new List<String>{'Berlin','Hamburg'});

        System.debug('Countries & State '+ mapCountry);
    }
 
    public static Map<String, List<Account> > searchAccountsMap(){
        //find all accounts where region is null
        //build map of region and list of accounts
        //output map

        List<Account> lstAccounts = [SELECT Id, Region__c FROM Account WHERE Region__c <> null];

        Map< String , List<Account> > mapAccount = new Map< String, List<Account> >();
        
        for(Account currentAccount : lstAccounts){
            if (mapAccount.containsKey(currentAccount.Region__c)){
               mapAccount.get(CurrentAccount.Region__c).add(currentAccount) ;
               //here not create a list again, 
               //because its already defined down there, just append to the list 👻
            }
            else {
                mapAccount.put(currentAccount.Region__c, new List<Account>{currentAccount}) ;
                // here create a lists because its just defined 👻
            }
        }
        
        System.debug('test '+ mapAccount);
        return mapAccount;
    }
}