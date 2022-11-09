/**
 * @File Name          : AP01_updateAccount.cls
 * @Description        : Initialisation with VS code
 * @Author             : Spoon Consulting
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-24-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    19/10/2022, HH:MM:SS      BNU      Initial Version
**/
public with sharing class AP01_updateAccount {
    public AP01_updateAccount() {

    }
    /**
         * @description Method to insert data in Account.
         * @author Bhavish Nundoo | 19/10/2022
         * @return String The managed object's name.
         **/
    public static void updateAcc() {
        Account acct = new Account();
        acct.Name = 'lolo polo';
        acct.Phone = '985632145';
        acct.Region__c = 'East';
        acct.BillingStreet = 'Royal Rd';
        acct.BillingCountry = 'Mauritius';
        acct.BillingCity = 'Moka';
        acct.BillingPostalCode = '3546';
        acct.BillingState = 'Moris';
        insert acct;
        System.debug('bhavish');
    }

    /**
         * @description Method to update the user Phone .
         * @author Bhavish Nundoo| 19/10/2022
         * @return String The managed object's name.
         **/
    public static void updateAccPhone(){
        Account acc = new Account();
        acc.Id = '0017S00000GQgU5QAL';
        acc.Phone = '56347382';
        update acc;
    }
    /**
         * @description Method to delete an Account.
         * @author Bhavish Nundoo| 19/10/2022
         * @return String The managed object's name.
         **/
    public static void deleteAcc(){
        Account accDet = new  Account();
        accDet.Id='0017S00000GQgU5QAL';
        delete accDet;
        }
     /**
         * @description Method to Display the name of accounts that have region = north.
         * @author Bhavish Nundoo| 19/10/2022
         * @return String The managed object's name.
         **/
    public static void DisplayAllAccountRegion(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Name, Region__c FROM Account WHERE Region__c = 'North'];

        for(Account acc : accList){
            System.debug(acc.Name);
        }
    }
    /**
         * @description Method to insert 10 Customer.
         * @author Bhavish Nundoo| 19/10/2022
         * @return String The managed object's name.
         **/
    public static void InsertIndividualTypeCustomer(){
        List<Account> lstAccIns = new List<Account>();
        List<Contact> lstContIns = new List<Contact>();
        
        
        
        String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId(); //getting the record typeid (for individual or Business)

        for(Integer i=0;i<10;i++){
            Account AccIns = new Account();
            AccIns.Name =  'Adi' + i;
            AccIns.Phone = '4579893';
            AccIns.Region__c = 'East';
            AccIns.BillingStreet = 'Royal Rd';
            AccIns.BillingCountry = 'Mauritius';
            AccIns.BillingCity = 'Reduit';
            AccIns.BillingPostalCode = '3546';
            AccIns.BillingState = 'Moris';
            AccIns.RecordTypeId = recordTypeId;
            lstAccins.add(AccIns);
        }

        if(lstAccIns.size()>0){
            insert lstAccIns;
        }

        for(Account acc:LstAccIns){
            Contact contact = new Contact();
            contact.AccountId = acc.Id;
            
            contact.MailingStreet = acc.BillingStreet;
            contact.MailingCountry = acc.BillingCountry;
            contact.MailingState = acc.BillingState;
            contact.MailingCity = acc.BillingCity;
            contact.LastName= acc.Name;
            contact.Phone= acc.Phone;
            contact.MailingPostalCode = acc.BillingPostalCode;

            


            
            
            lstContIns.add(contact);
        }

        if(lstContIns.size()>0){
            insert lstContIns;
        }

    }

    /**
         * @description Method to query vehicle.
         * @author Bhavish Nundoo| 19/10/2022
         * @return String The managed object's name.
         **/

    public static void queryVehicle(String colour){
        
        List<Vehicle__c> lstVeh = new List<Vehicle__c>(); 
        lstVeh = [SELECT Id, Make__c, Model__c, Mileage__c, Colour__c FROM Vehicle__c WHERE Colour__c =:colour];
        
        
        if(lstVeh.size()>0){
            for(Vehicle__c veh :lstVeh){

                System.debug(veh);
            }
            
        }
     }
     /**
         * @description Method to query vehicle using sets.
         * @author Bhavish Nundoo| 20/10/2022
         * @return String The managed object's name.
         **/

     public static void queryVehicleSet(){
        Set<String> set1 = new Set<String>{'Blue','Black'};
        List<Vehicle__c> lstVeh1 = [SELECT Id, Make__c, Model__c, Mileage__c, Colour__c FROM Vehicle__c WHERE Colour__c IN:set1];
        
        
        if(lstVeh1.size()>0){
            
                System.debug(lstVeh1);
            
            
        }
     }
/**
         * @description Method to map.
         * @author Bhavish Nundoo| 20/10/2022
         * @return Add values in the map.
         **/

     public static void mapExercise(){
        Map<String, String> mapRegNumMake = new Map<string, String>();

        mapRegNumMake.put('12 JN 94','Toyota Glanza');
        mapRegNumMake.put('78 OC 98','Toyota Supra');
        mapRegNumMake.put('1 JN 22','BMW X6 M');
        mapRegNumMake.put('678 DC 00','Honda Civic EK3');

        System.debug('My Cars and Their make: mapRegNumMake:' + mapRegNumMake);

        System.debug('Map Size: mapRegNumMake:' + mapRegNumMake.size());


     }


     public static void mapClothColor(){
        Map<String, List<String>> mapColor = new Map<String,List<String>>();
        mapColor.put('Black',new List<String>{'bhav','ha'});
        mapColor.put('Red',new List<String>{'asma','haj'});

        if(mapColor.containsKey('Black')){
            System.debug('My Map' +mapColor.get('Black'));
        }

        System.debug('Different colours' +mapColor.keySet());
        //display all the keys of the map

        System.debug('All super happy employee' +mapColor.Values());
        // displays all values of the map

        Integer numOfEmployees = 0;
        for(String colour : mapColor.keySet()){
            numOfEmployees += mapColor.get(colour).Size();
        }

        System.debug('Number of Extreme happy employee'+ numOfEmployees);

     }
/**
         * @description Method to map country in a map.
         * @author Bhavish Nundoo| 20/10/2022
         * @return the values in the map.
         **/
     public static void mapStoreCountry(){
        Map<String, List<String>> mapCountry = new Map<String,List<String>>();
        mapCountry.put('United States',new List<String>{'Connecticut' , 'Nebraska', 'New Jersey'});
        mapCountry.put('Germany',new List<String>{'Berlin', 'Hamburg'});

        if(mapCountry.containsKey('United States')){
            System.debug('States of United States' +mapCountry.Values());
        }

     }
/**
         * @description Method to query Account where region is not null.
         * @author Bhavish Nundoo| 20/10/2022
         * @return Account where region is not null, add to map.
         **/
     public static void queryAccRegionNotEmp(){
        Map<String,List<Account>> mapRegion = new Map<String,List<Account>>();
        List<Account> lstAcc = [SELECT Id, Name, Region__c FROM Account WHERE Region__c != Null];
        
        // loop through the list that was retrieve.
        for(Account acc: lstAcc){
           
            if(mapRegion.containsKey(acc.Region__c)){
                mapRegion.get(acc.Region__c).add(acc); // check if key already exist in map and add only the detail of the account
                
            }else {
                mapRegion.put(acc.Region__c, new List<Account>{acc});//if key does not exist, add key and value
            }
        }
        System.debug('Accounts : '+ mapRegion);
        



        /*Map<String,Account> mapRegion = new Map<String,Account>();
        for(Account acc: [SELECT Id, Name, Region__c FROM Account WHERE Region__c != null]){
            mapRegion.put(acc.Region__c,acc);
        }
        if(mapRegion.containsKey('North')){
            System.debug('Accounts : '+ mapRegion);
        }*/

        
        

     }
     /**
         * @description Method to query Damaged Vehicle.
         * @author Bhavish Nundoo| 20/10/2022
         * @return a list of Damaged Vehicle.
         **/
     public static void getDamagedVehicle(){
        List<Case> lstCase = [SELECT  DamageType__c, LoanedVehicle__c, LoanedVehicle__r.Name FROM Case WHERE DamageType__c!= Null ORDER BY DamageType__c];
        
        System.debug(lstCase);



    }

    /**
         * @description Method to query account having a case.
         * @author Bhavish Nundoo| 20/10/2022
         * @return a list of account having a case.
         **/
        public static void geAllAcc(){
            
            List<Case> lstcse =[SELECT AccountId FROM Case WHERE AccountId!= null ];
           

            Set <Id> setAccId = new Set<Id>();
            Map<String,List<Account>> mapAcc = new Map<String,List<Account>>();
            
            for(Case cse: lstcse){
                
                setAccId.add(cse.AccountId);
            }
            List<Account> lstAcc =[SELECT Name, RecordType.DeveloperName FROM Account WHERE 
            Id =:setAccId AND RecordType.DeveloperName!= Null];

            for (Account acc : lstAcc) {
                if (mapAcc.containsKey(acc.RecordType.DeveloperName)) {
                    mapAcc.get(acc.RecordType.DeveloperName).add(acc);
                }else{
                    mapAcc.put(acc.RecordType.DeveloperName, new List<Account>{acc} );
                }
            }
            System.debug('Accounts having cases : '+ mapAcc);

        }
        /**
         * @description Method to assign account and contact of region north to manager.
         * @author Bhavish Nundoo| 24/10/2022
         * @return account assign to manager.
         **/

        public static void assingRegion(){
            List<Account> lstAcc = [SELECT Id, OwnerId, Name, Region__c, RecordType.DeveloperName  FROM Account Where Region__c ='North' AND RecordType.DeveloperName ='Individual' ];
            List<User> lstUsr = [SELECT Id FROM User WHERE UserRole.Name ='Manager' AND IsActive =true];

            if (lstUsr.size()>0) {
                for(Account acc:lstAcc){
                    acc.OwnerId = lstUsr[0].Id;
                }
                update lstAcc;
            }

        }
        /**
         * @description Method to delete all account and contact created today.
         * @author Bhavish Nundoo| 24/10/2022
         * @return account and contact deleted.
         **/

        public static void detAllAccCon(){
            List<Account> lstAcc = [SELECT Id,  Name  FROM Account WHERE Name LIKE 'Adi%'];
            

            if (lstAcc.size()>0) {
                delete lstAcc;
            }
            

        }
    

    
    
    
}