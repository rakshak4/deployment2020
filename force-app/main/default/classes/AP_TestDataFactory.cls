/**
 * Test data factory methods to facilitate test data creation and management
 * @author            : VMU
 * @group             : SC
 * @last modified on  : 09-10-2022
 * @last modified by  : VMU
**/
@isTest
public class AP_TestDataFactory {
    public static list<User> lstUsers;
    public static list<Account> lstIndividuals;
    public static list<Account> lstBusinesses;
    public static list<Vehicle__c> lstPersonalVehicles;
    public static map<String,Id> mapOfRecordTypeId = new Map<String, Id>();

    /**
     * This method retrieve all active record types used on this org
     * @return [description]
     */
    public static map<String,id> getRecordTypes(){
        system.debug('## retrieving all recordTypes');

        map<String,id> mapOfResult = new map<String,id>();

        for(RecordType r : [select DeveloperName
                            from RecordType
                            where IsActive = true])
        {            
            mapOfResult.put(r.DeveloperName,r.id);
        }       

        return mapOfResult;    
    }
    /**
     * This method generate a list of users and fill up the compulsory info
     * 
     * @param users - a list of user
     */
    public static void generateUsers(List<User> users){
        system.debug('## generating users ');
        
        for(integer i=0;i<users.size();i++){                
            if(String.isBlank(users[i].email)) users[i].email = users[i].FirstName + '.' + users[i].LastName + '@spoonconsulting.dev';
            if(String.isBlank(users[i].profileid)) users[i].ProfileId = UserInfo.getProfileId();
            if(String.isBlank(users[i].UserName)) users[i].UserName = users[i].email;            
            if(String.isBlank(users[i].Alias)) users[i].Alias = i + 'TST1';
            if(String.isBlank(users[i].TimeZoneSidKey)) users[i].TimeZoneSidKey = 'America/New_York';
            if(String.isBlank(users[i].EmailEncodingKey)) users[i].EmailEncodingKey = 'ISO-8859-1';
            if(String.isBlank(users[i].LocaleSidKey)) users[i].LocaleSidKey = 'en_US';
            if(String.isBlank(users[i].LanguageLocaleKey)) users[i].LanguageLocaleKey = 'en_US';            
        }
        insert users;
    }
    /**
    * This method add additional info to the list of business accounts and ensure the 
    * necesssary info are filled
    * @param accounts 
    **/
    public static void generateBusinesses(List<Account> accounts){     
        system.debug('## generating business accounts');

        if(mapOfRecordTypeId.isEmpty() || mapOfRecordTypeId == null) mapOfRecordTypeId = getRecordTypes();        
        Id recTypeId = mapOfRecordTypeId.get('Business');
         
        for(integer i = 0; i < accounts.size(); i++){ 
            if(String.isBlank(accounts[i].Name)) accounts[i].Name = 'Gama civic LTD';            
            if(String.isBlank(accounts[i].Region__c)) accounts[i].Region__c = 'North';            
        }
        insert accounts;
    }
    /**
    * This method add additional info to the list of individual accounts and ensure the 
    * necesssary info are filled
    * @param accounts 
    **/
    public static void generateIndividuals(List<Account> accounts){     
        system.debug('## generating person accounts');

        if(mapOfRecordTypeId.isEmpty() || mapOfRecordTypeId == null) mapOfRecordTypeId = getRecordTypes();        
        Id recTypeId = mapOfRecordTypeId.get('Individual');

        for(integer i = 0; i < accounts.size(); i++){ 
            if(String.isBlank(accounts[i].Name)) accounts[i].Name = 'Paul Pogba ' + i; 
            if(String.isBlank(accounts[i].Email__c)) accounts[i].Email__c = 'paul.pogba0' + i + '@gmail.test';
            if(String.isBlank(accounts[i].Mobile__c)) accounts[i].Mobile__c = '678890987' + i; 
            if(String.isBlank(accounts[i].Region__c)) accounts[i].Region__c = 'North';          
            //recordtypeid
            accounts[i].RecordTypeID = recTypeId;
        }
        insert accounts;
    }
    /**
    * This method add additional info to the list of individual accounts and ensure the 
    * necesssary info are filled
    * @param accounts 
    **/
    public static void generateCustomerVehicles(List<Vehicle__c> vehicles){     
        system.debug('## generating customer vehicles');

        if(mapOfRecordTypeId.isEmpty() || mapOfRecordTypeId == null) mapOfRecordTypeId = getRecordTypes();        
        Id recTypeId = mapOfRecordTypeId.get('Customer_Vehicle');

        for(integer i = 0; i < vehicles.size(); i++){             
            if(String.isBlank(vehicles[i].RegistrationNumber__c)) vehicles[i].RegistrationNumber__c = '78' + i + 'JN20';
            if(String.isBlank(vehicles[i].Make__c)) vehicles[i].Make__c = 'Nissan';  
            if(String.isBlank(vehicles[i].Model__c)) vehicles[i].Model__c = 'March'; 
            if(vehicles[i].InsuranceStartDate__c == null) vehicles[i].InsuranceStartDate__c = Date.newInstance(2022, 1, 1);   
            if(vehicles[i].InsuranceEndDate__c == null) vehicles[i].InsuranceEndDate__c = Date.newInstance(2022, 12, 31);              
            //recordtypeid
            vehicles[i].RecordTypeID = recTypeId;
        }
        insert vehicles;
    }
    /**
     * This method will generate the basic test data require for a test, meaning some:
     * 1. Users - The first user as an admin listOfUsers[0]
     * 2. Accounts
     * 3. vehicles
     */
    public static void generateBasicTestData(){

        system.debug('## starting creating basic test data');         
        
        mapOfRecordTypeId = getRecordTypes();

        lstUsers = new list<User>{
            //admin
            new User(FirstName = 'Jacqueline',LastName = 'Fernandez'),
            new User(FirstName = 'Jackie',LastName = 'Chan')          
        };
        generateUsers(lstUsers);       

                
        system.runas(lstUsers[0]){             
            
            //create some individual accounts
            lstIndividuals = new list<Account>{
                new Account(Name = 'Marcus Rashford',Email__c = 'marcus.rashford@gmail.test'),
                new Account(Name = 'Anthony Martial',Email__c = 'anthony.martial@gmail.test')
            };
            generateIndividuals(lstIndividuals);

            //create some business accounts
            lstBusinesses = new list<Account>{
                new Account(Name = 'BDO LTD'),
                new Account(Name = 'BLUE LAGOON LTD')
            };
            generateBusinesses(lstBusinesses);

            //create some personal vehicles
            lstPersonalVehicles = new list<Vehicle__c>{
                new Vehicle__c(RegistrationNumber__c = '7890JL21',InsuredTo__c = lstIndividuals[0].Id),                
                new Vehicle__c(RegistrationNumber__c = '789ZN20',InsuredTo__c = lstIndividuals[1].Id),
                new Vehicle__c(RegistrationNumber__c = '400ZN20',InsuredTo__c = lstBusinesses[0].Id),
                new Vehicle__c(RegistrationNumber__c = '12JN20',InsuredTo__c = lstBusinesses[0].Id),
                new Vehicle__c(RegistrationNumber__c = '13JN20',InsuredTo__c = lstBusinesses[1].Id)
            };
            generateCustomerVehicles(lstPersonalVehicles);            
                     
        }
    }

    //SAU - Generate users in solo
    public static User createUser(){
        system.debug('## generating users in solo ');

        User user = new User();
        user.email = 'TestName';
        user.profileid = UserInfo.getProfileId();
        user.UserName = 'TestYser';
        user.Alias =  'TST1';
        user.TimeZoneSidKey = 'America/New_York';
        user.EmailEncodingKey = 'ISO-8859-1';
        user.LocaleSidKey = 'en_US';
        user.LanguageLocaleKey = 'en_US'; 

        return user;

    }

    //SAU - Generate Account in solo
    public static Account createAcc(){
        Account acc = new Account();
        acc.Name              = 'TestAcc1';
        acc.Type              = 'Customer - Direct';
        acc.BillingCity       = 'San Francisco';
        acc.BillingState      = 'CA';
        acc.BillingPostalCode = '94087';
        acc.BillingCountry    = 'US';
        acc.Industry          = 'Energy';
        acc.Rating            = 'Warm';
        acc.Region__c         = 'North';

        return acc;
    }


    //SAU - Generate users in bulk

    public static List <User> createUsers(Integer NumUsers){
        system.debug('## generating users in bulk');

        List <User> lstUsers = new List <User>();
        
        for(integer i=0;i<NumUsers;i++){  
            User user = new User();
            user.email = 'TestName';
            user.profileid = UserInfo.getProfileId();
            user.UserName = 'Test' + i +'ser@mail.com';
            user.Alias =  'TST1';
            user.TimeZoneSidKey = 'America/New_York';
            user.EmailEncodingKey = 'ISO-8859-1';
            user.LocaleSidKey = 'en_US';
            user.LanguageLocaleKey = 'en_US';
            
            lstUsers.add(user);
        }
        return lstUsers;

    }

    //SAU - Generate Account in bulk
    public static List<Account> createAccs( Integer NumAccs){

        
        List <Account> lstAccs = new List <Account>();
        
        for(integer i=0;i<NumAccs;i++){  
            Account acc = new Account();
            acc.Name              = 'TestAcc1';
            acc.Type              = 'Customer - Direct';
            acc.BillingCity       = 'San Francisco';
            acc.BillingState      = 'CA';
            acc.BillingPostalCode = '94087';
            acc.BillingCountry    = 'US';
            acc.Industry          = 'Energy';
            acc.Rating            = 'Warm';
            acc.Region__c         = 'North';

            lstAccs.add(acc);
        }
      

        return lstAccs;
    }

    public static Case createMechanicalCase(){
        Case caseObj = new Case();
        caseObj.Type      = 'Mechanical';
        caseObj.Reason    = 'Breakdown';
        caseObj.Subject   = 'Ignition problems';
        caseObj.Priority  = 'High';

        return caseObj;
    }

    public static List <Case> createMechanicalCases(Integer numCase){
        List<Case> lstCases = new List<Case>();
        for (Integer i = 0; i < numcase; i++){
            Case caseObj = new Case();
            caseObj.Type      = 'Mechanical';
            caseObj.Reason    = 'Breakdown';
            caseObj.Subject   = 'Ignition problems';
            caseObj.Priority  = 'High';

            lstCases.add(caseObj);
        }

        return lstCases;
    }

    public static List <Contact> createContacts(Integer numContact){
        List<Contact> lstContacts = new List<Contact>();
        for (Integer i = 0; i < numContact; i++){
            Contact ContactObj = new Contact();
            ContactObj.FirstName     = 'Andy';
            ContactObj.LastName    = 'Young';
            ContactObj.Salutation   = 'Ms';
            ContactObj.Phone  = '(785) 241-6200	';

            lstContacts.add(ContactObj);
        }

        return lstContacts;

    }

    public static List <Invoice__c> createInvoices(Integer numInvoice){
        List <Invoice__c> lstInv = new List <Invoice__c> ();

        for (Integer i = 0; i < numInvoice; i++){
            Invoice__c invoiceObj = new Invoice__c ();

            invoiceObj.AmountWithoutVat__c = 1000.0;
            invoiceObj.Vat__c = 12.0;
            invoiceObj.LastPaymentDate__c =  system.today().addMonths(3);
            lstInv.add(invoiceObj);
        }
        return lstInv;
    }




}