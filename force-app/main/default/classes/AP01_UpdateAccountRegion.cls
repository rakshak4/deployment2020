/**
 * @File Name          : AP01_UpdateAccountRegion.cls
 * @Description        : Initialization with VsCode
 * @Author             : Spoon Consulting Limited
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-20-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    19-10-2022, HH:MM:SS      <AGO>      Initial Version
**/
    
public with sharing class AP01_UpdateAccountRegion {
/**
         * @description Method to identify the managed object.
         * @author Ashita Gopaul | 19/10/2022
         * @return String The managed object's name.
         **/
        public static void helloWorld(){
            System.debug('Ashitaaaaa');
            Account acc = new Account();
            acc.Name = 'Toto Polo';
            acc.BillingStreet = 'Royal Rd';
            acc.BillingCity = 'Moka';
            acc.BillingCountry = 'Mauritius';
            acc.Phone = '985632145';
            acc.Region__c = 'East';
            
            insert acc;
            
        }

        public static void updateAccount(){
            Account acc = new Account(Id='0017S00000GQgbQQAT', Phone='00000');
            update acc;

        }

        public static void deleteAccount(){
            Account acc = new Account(Id='0017S00000GQgbQQAT');
            delete acc;
        }

        public static void displayAccountsRegionNorth(){
            List<Account>lstAccs=[SELECT Name FROM Account WHERE Region__c='North'];
            for(Account acc: lstAccs){
                System.debug(acc.Name);
            }

        }

        public static void insertAccounts(){
            List<Account>lstAccs=new List<Account>();
            String recordTypeId= Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
            for(Integer i=0; i<10; i++){
                Account acc= new Account();
                acc.Name = 'Ashita11xxx'+i;
                acc.BillingStreet = 'Royal Rd';
                acc.BillingCity = 'Moka';
                acc.BillingCountry = 'Mauritius';
                acc.Phone = '985632145';
                acc.Region__c = 'East';
                acc.recordTypeId= recordTypeId;
                lstAccs.add(acc);
            }
            if(lstAccs.size()>0){
                insert lstAccs;
            }

            List<Contact>lstCon=new List<Contact>();
            for(Account acc:lstAccs){
                Contact con=new Contact();
                con.LastName='Ash'+1;
                con.Phone='00000';
                con.AccountId=acc.Id;
                con.MailingCity=acc.BillingCity;
                lstCon.add(con);

            }

            if(lstCon.size()>0){
                insert lstCon;
            }

        }

        public static void findVehicles(String Color){
            List<Vehicles__c>lstVeh=[SELECT Make__c, Model__c, Mileage__c FROM Vehicles__c WHERE Colour__c=: Color];
            for(Vehicles__c veh: lstVeh){
                System.debug(veh);
            }

        }

        public static void findVehiclesSet(){
            Set<String>setColor=new Set<String>{'Red','White'};
            List<Vehicles__c>lstVeh=[SELECT Make__c, Model__c, Mileage__c FROM Vehicles__c WHERE Colour__c IN:setColor];
            for(Vehicles__c veh: lstVeh){
                System.debug(veh);
            }

        }

        public static void mapCar(){
            Map<String,String> mapRegNumMake= new Map<String,String>();
            //add items
            mapRegNumMake.put('12 JN 94', 'Toyota Glanza');
            mapRegNumMake.put('78 OC 98', 'Toyota Supra');
            mapRegNumMake.put('1 JN 22', 'BMW X6 M');
            mapRegNumMake.put('678 DC 00', 'Honda Civic EK3');

            //print the values
            System.debug('My cars and their make: mapRegNumMake '+ mapRegNumMake);

            //print map size
            System.debug('Map Size: mapRegNumMake '+ mapRegNumMake.size());

        }

        public static void mapColorWithNames(){
            Map<String,List<String>> mapColorNames= new Map<String,List<String>>();
            mapColorNames.put('Red', new List<String>{'ash','ag'});
            mapColorNames.put('Blue', new List<String>{'ash01','ag01'});
            System.debug('Map: '+ mapColorNames);
            if(mapColorNames.containsKey('Red')){
                System.debug('Happy employees wearing Red color: '+ mapColorNames.get('Red'));
            }
           
            if(mapColorNames.containsKey('Blue')){
                System.debug('Happy employees wearing Blue color: '+ mapColorNames.get('Blue'));
            }
            
            System.debug('Different colors: '+ mapColorNames.keySet());
            System.debug('All super happy employee names: '+mapColorNames.Values());

            Integer numOfEmployees=0;
            for(String color: mapColorNames.keySet()){
                //mapColorEmployee.get(color) returns list of happy employees wearing color x
                numOfEmployees+= mapColorNames.get(color).size();
            }
            System.debug('Number of extremely happy employees: '+ numOfEmployees);
            
        }
        public static void mapCountryToStates(){
            Map<String,List<String>> mapCountryStates= new Map<String,List<String>>();
            mapCountryStates.put('United States', new List<String>{'Connecticut' , 'Nebraska', 'New Jersey'});
            mapCountryStates.put('Germany ', new List<String>{'Berlin', 'Hamburg'});
            System.debug('Map: '+ mapCountryStates);

        }

        public static void example3(){
            //query to retrieve accounts where region is not null
            List<Account>lstAccs=[SELECT Name, Region__c FROM Account WHERE Region__c != null]; 
            Map<String ,List<Account>> mapRegAcc= new Map<String,List<Account>>();
            //iterate through list of accounts
            for(Account acc: lstAccs){
                //if map does not contain key, insert key and create empty list
                if(!mapRegAcc.containsKey(acc.Region__c)){
                    mapRegAcc.put(acc.Region__c,new List<Account>());
                }
                //add the account to the list mapped with the key acc.Region__c
                mapRegAcc.get(acc.Region__c).add(acc);
            }
            System.debug('Map: '+mapRegAcc );
        }

        public static void retriveAccList(){
            List<Account>lstAccs=[SELECT Name, RecordType.DeveloperName FROM Account WHERE Id IN (SELECT AccountId FROM Case) AND RecordType.DeveloperName!=null];
            Map<String ,List<Account>> mapRecTypeAcc= new Map<String,List<Account>>();
             //iterate through list of accounts
             for(Account acc: lstAccs){
                //if map does not contain key, insert key and create empty list
                if(!mapRecTypeAcc.containsKey(acc.RecordType.DeveloperName)){
                    mapRecTypeAcc.put(acc.RecordType.DeveloperName,new List<Account>());
                }
                //add the account to the list mapped with the key acc.RecordType.DeveloperName
                mapRecTypeAcc.get(acc.RecordType.DeveloperName).add(acc);
            }
            System.debug('Map: '+mapRecTypeAcc);
        }
}