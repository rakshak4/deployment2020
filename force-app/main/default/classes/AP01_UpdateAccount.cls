/**
 * @File Name          : AP01_UpdateAccount.cls
 * @Description        : Initialisation with vs code
 * @Author             : <Company Name>
 * @Group              : 
 * @Last Modified By   : Rayhaan Beeharry
 * @Last Modified On   : 11-08-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    DD-MMM-YYYY, HH:MM:SS      RBE      Initial Version
**/

public with sharing class AP01_UpdateAccount {
    /**
     * @description Method to insert a new Account object
     * @author Rayhaan Beeharry | 10/19/2022
     * @return String The managed object's name.
     **/
    public static void insertAccount(){
        System.debug('Hello there');
        Account acc= new Account();
        acc.Name = 'Toto Polo';
        acc.BillingStreet = 'Royal Rd';
        acc.BillingCity = 'Moka';
        acc.BillingCountry = 'Mauritius';
        acc.Phone = '985632145';
        acc.Region__c = 'East';
        insert acc;
    }

    /**
     * @description Method to update phone number of an Account object
     * @author Rayhaan Beeharry | 10/19/2022
     * @return String The managed object's name.
     **/
    public static void updatePhone(String name, String phone) {
        String id= [Select Id from Account Where Name=:name][0].Id;
        Account acc = new Account (Id= id, Phone=phone);
        update acc;
    }

    /**
     * @description Method to delete the Account object with the Id specified.
     * @author Rayhaan Beeharry | 10/19/2022
     * @return String The managed object's name.
     **/
    public static void deleteAcc() {
        Account acc = new Account(Id='0017S00000GGS4ZQAX');
    }

    /**
     * @description Method to display Accounts with region Nort.
     * @author Rayhaan Beeharry | 10/19/2022
     * @return String The managed object's name.
     **/
    public static void displayAccNameNorth(){
        List<Account> lstAccounts= [select Id, Name from Account where Region__c='North'];
        for(Account acc:lstAccounts){
            System.debug('Id: '+acc.Id+' Name: '+acc.Name);
        }
    }

    /**
     * @description Method to insert 10 Accounts, along with one account for each Account.
     * @author Rayhaan Beeharry | 10/19/2022
     * @return String The managed object's name.
     **/
    public static void insertAccounts(){
        List<Account> lstAcc = new List<Account>();
        String billingStreet;
        String phone;
        String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        for(Integer i=0;i<10;i++){
            billingStreet='Street '+(i+1);
            phone='1233'+(i+1);

            Account acc = new Account(Name='Account'+(i+1), 
            Region__c='North',Phone=phone,BillingStreet=billingStreet,
            RecordTypeId=recordTypeId );        

            lstAcc.add(acc);
        }
        if(lstAcc.size()>0)
            insert lstAcc;    
       
        Integer i =0;
        List<Contact> lstContacts= new List<Contact>();
        for(Account acc: lstAcc){            
            lstContacts.add( new Contact (AccountId=acc.Id,FirstName='ContactFirstName'+(i+1),
            LastName='ContactLastName'+(i+1), MailingStreet=billingStreet,Phone=phone));
            i++;
        }

        if(lstAcc.size()>0)
            insert lstContacts;
    }
    /**
     * @description  Create a map to store country as Key and corresponding states as Values.
        United States -> Connecticut , Nebraska, New Jersey
        Germany -> Berlin, Hamburg
     * @author Rayhaan Beeharry | 10/19/2022
     * @return String The managed object's name.
     **/
   public static void mapCountryStates(){
    Map<String,List<String>> mapCountryStates= new Map<String,List<String>>();
    
    mapCountryStates.put('United States',new List<String>{'Connecticut', 'Nebraska', 'New Jersey'});
    mapCountryStates.put('Germany',new List<String>{'Berlin','Hamburg'});
    System.debug(mapCountryStates);
   }

    /**
     * @description  Create a map of regions and a list of accounts for each region.
        United States -> Connecticut , Nebraska, New Jersey
        Germany -> Berlin, Hamburg
     * @author Rayhaan Beeharry | 10/19/2022
     * @return String The managed object's name.
     **/
    public static void mapRegion(){
        List<Account> lstAcc=[SELECT Name,Region__c FROM Account WHERE Region__c != NULL];
        if(lstAcc.size()==0){
            return;
        }
        System.debug(lstAcc);
        
        Map<String,List<Account>> mapRegionAcc= new Map<String,List<Account>>();
        for(Account acc: lstAcc){
            // If map does not have a key for the region of the current account
            if(!mapRegionAcc.containsKey(acc.Region__c)){
                // Add new entry in map with an empty list for account
                mapRegionAcc.put(acc.Region__c,new List<Account>());
            }
            // else add current account to list for the current region
            mapRegionAcc.get(acc.Region__c).add(acc);
        }
        for(String reg:mapRegionAcc.keySet()){
            System.debug('Region: '+reg+' Accounts: '+mapRegionAcc.get(reg));
        }        
    }

    /**
     * @description  Find all accounts having a case and display by recordType.
     * @author Rayhaan Beeharry | 10/19/2022
     * @return String The managed object's name.
     **/
    public static void getAccountsWithCase(){
        List<Account> lstAcc = [SELECT Name, RecordType.DeveloperName 
                                FROM Account WHERE Id IN (SELECT AccountId FROM Case)];
                                
        if(lstAcc.size()==0){
            return;
        }
        System.debug(lstAcc);
        Map<String,List<Account>> mapRecordTypeAccounts= new Map<String,List<Account>>();
        String recordType;
        
        for(Account acc: lstAcc){        
          if(acc.RecordType.DeveloperName!=null){          
          
            recordType=acc.RecordType.DeveloperName;
            if(!mapRecordTypeAccounts.containsKey(recordType)){
                    mapRecordTypeAccounts.put(recordType,new List<Account>());
                }
                mapRecordTypeAccounts.get(recordType).add(acc);
            }          
        }        
        System.debug(mapRecordTypeAccounts);        
    }

     /**
     * @description  Assign all accounts of region “North” having recordType ‘Customer’ 
     * and their related contacts to the manager.
     * @author Rayhaan Beeharry | 10/19/2022
     * @return String The managed object's name.
     **/
    public static void AssignNorthAccountsAndContactsToManager(){
        List<Account> lstAcc = [SELECT Id, Name, (SELECT Id, FirstName FROM Contacts) 
                                FROM Account 
                                WHERE Region__c = 'North' AND RecordType.DeveloperName ='Individual' ];
        String managerId= [SELECT Id,Name FROM User WHERE Profile.Name= 'Manager'][0].Id;
        System.debug(managerId);        
        for(Account acc: lstAcc){
            List<Contact> lstContacts= new List<Contact>();
            acc.OwnerId= managerId;
            for(Contact con: acc.Contacts){
                lstContacts.add(con);
            }
        }
        update lstAcc;
    }

    /**
     * @description  Delete accounts and contacts created on the current date
     * @author Rayhaan Beeharry | 10/19/2022
     **/
    public static void deleteAccountContactsCreatedToday(){
        delete [SELECT ID FROM Contact WHERE CreatedDate = TODAY];
        
        delete [SELECT ID FROM Account WHERE CreatedDate = TODAY];
    } 
}