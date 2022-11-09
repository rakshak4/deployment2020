/**
 * @File Name          : AP02_UserStories.cls
 * @Description        : working on case study
 * @Author             : Sambhav Bholah
 * @Group              : 
 * @Last Modified By   : Sambhav Bholah
 * @Last Modified On   : 11-08-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    20-OCT-2022, HH:MM:SS      SBH      Initial Version
**/
public with sharing class AP02_UserStories {


    /**
    * @description Damaged vehicles should be listed in order of damage type.
    * @author Sambhav Bholah | 20-OCT-2021
    * @return void
    **/
    public static void US_APEX01(){
        
        //get picklist values
        //Schema.DescribeFieldResult pick = Case.Damage_type__c.getDescribe();
        //List<Schema.PicklistEntry> P = pick.getPicklistValues();
        //system.debug(P);
        System.debug('US_APEX01 Starts');
        List<Case> lstCase = [SELECT Damage_type__c, LoanToVehicle__r.Model__c FROM Case WHERE LoanToVehicle__c <> NULL ORDER BY Damage_type__c];

        //List<Vehicle__c> lstVehicles = [SELECT Model__c FROM Vehicle__c WHERE ID IN lstCase.LoanToVehicle__c];
        system.debug(lstCase);
    }


    /**
    * @description display list of accounts and mapped by their record type
    * @author Sambhav Bholah | 20-OCT-2021
    * @return void
    **/
    public static Map <String, List<Account> > US_APEX02(){
        //Find all accounts having a case and display by recordType.
        //Output: One map with two keys, one for each recordType

        // PLAN 🔗
        // 1. Search for all accounts that have a case linked 
        //      1.1 - Search into CASE to find all accounts that has a case (lookup on Account__c) ✅ 
        //      1.2 - put all account ID received into a set (set will keep them unique )          ✅ 
        //2. Create a map with string(record type) and list(of accounts)
        //      2.1 retrieve all account details that has a case (use setAccountId)                ✅
        //      2.2 loop Thru accounts to create the map                                           ✅

        System.debug('US_APEX02 Starts');
        List<Case> lstCase = [SELECT Subject, Account__r.Id FROM Case WHERE Account__c <> NULL];
        Set<Id> setAccountId = new Set<Id>();

        // loop to populate the setAccoundId with all the unique account Ids
        for(Case caseElement: lstCase){
            setAccountId.add(caseElement.Account__r.Id);
        }
        //system.debug(setAccountId);

        //how to map IDs from an object into a map by making use of key set
        //Map<Id, Account > mapName = new Map <Id, Account>(lstAccount>);
        // setAccountId = mapName.keyset();

        //retrieve all accounts
        List<Account> lstAccount = [SELECT Name, AccountNumber, RecordType.DeveloperName 
        FROM Account 
        WHERE Id IN: setAccountId AND RecordType.DeveloperName <> NULL];

        //create a map with string(record type) and list(account)
        Map<String, List<Account> > mapAccountsWithCases = new map<String, List<Account> >();

        for(Account currentAcc: lstAccount){
            //system.debug(currentCase.Account__r.RecordType.DeveloperName);

            if (mapAccountsWithCases.containsKey(currentAcc.RecordType.DeveloperName)){
                mapAccountsWithCases.get(currentAcc.RecordType.DeveloperName).add(currentAcc);               
            }
            else {
                mapAccountsWithCases.put(currentAcc.RecordType.DeveloperName , new List<Account>{currentAcc});
            }
        }
        system.debug('Map displays:');
        system.debug(mapAccountsWithCases);
        System.debug('US_APEX02 Ends');
        return mapAccountsWithCases;
        
    }  

    /**
    * @description display list of accounts and mapped by their record type
    * @author Sambhav Bholah | 20-OCT-2021
    * @return void
    **/
    public static void US_APEX03(){
        // Title : Assign all accounts of region “North” having recordType ‘Customer’ and their related contacts to the manager.
        // Acceptance Criterias: 
        // The accounts and contacts update must be seen on account and related contact after execute anonymous.

        // PLAN 🔗
        // 1. Get all related accounts
        //  1.1 retrieve all accounts where region__c = "North" and recordType.DeveloperName = 'Customer' ✅
        //  1.2 put it into a list                                                                        ✅
        //  2. search for role where profilename = manager and is active and get ID                       ✅
        //  2.1 For each account, go search their related contacts - contacts.AccountName = accountID     ✅
        //  3. Update both lstAccs where ownerID = manager                                                ✅
        // Queries 📝:
        //  SELECT Name FROM Account WHERE Region__c = 'North' AND RecordType.DeveloperName = 'Individual'
        //  SELECTId  FROM User WHERE Profile.Name = 'Manager' AND IsActive = true 
        //[SELECT name, OwnerId  from Contact WHERE AccountId =: acc.Id];
        //        List<Contact> lstContact = new List<Contact>();

        System.debug('US_APEX03 Starts ');
        List<Account> lstAccount = [SELECT Name, ownerID FROM Account WHERE Region__c = 'North' AND RecordType.DeveloperName = 'Individual']; 
        List<Contact> lstContact = new List<Contact>();

        String managerID = [SELECT Id  FROM User WHERE Profile.Name = 'Manager' AND IsActive = true][0].id;
        //System.debug('\n This is the manager ID' + managerID);

        for(Account acc: lstAccount){
            acc.ownerID = managerID;  
            Contact conc = [SELECT name, OwnerId  from Contact WHERE AccountId =: acc.Id];
            conc.OwnerId = managerID;
            lstContact.add(conc);
        }
        
        if (lstAccount.size() > 0 ){
            UPDATE lstAccount;
        }
        
        if (lstContact.size() > 0 ){
            UPDATE lstContact;
        }

        System.debug('\n US_APEX03 Ends');
    }

    /**
    * @description Delete all accounts and contacts created today
    * @author Sambhav Bholah | 20-OCT-2021
    * @return void
    **/
    public static void US_APEX05(){
        // Title : Delete all accounts and contacts created today
        // Acceptance Criterias: 
        // All accounts and contacts created today deleted.

        //PLAN 🔗
        //  1. Get all accounts created today (date created = today)
        //  2. Delete

        System.debug('US_APEX05 Starts \n');
        List<Account> lstAccount = [SELECT Id FROM Account WHERE CreatedDate = TODAY];
        List<Contact> lstContact = [SELECT Id FROM Contact WHERE CreatedDate = TODAY];
        
        for(Account acc: lstAccount){
            DELETE acc;
        }

        for(Contact conc: lstContact){
            DELETE conc;
        }
        System.debug('\n US_APEX05 Ends ');
    }
}