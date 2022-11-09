/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-24-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AP02_CaseStudy {
    public AP02_CaseStudy() {
        

    }
    /**
         * @description Find all Damaged vehicles list by damage type..
         * @author Dhomah Bhoovanyu | 20/10/2022
         * @return String The managed object's name.
    **/
    public static void findDamagedVeh(){
        List<Case> lstVeh = [SELECT DamagedVehicle__r.Model__c, DamagedVehicle__r.Make__c FROM Case ORDER BY DamageType__c];
        for(Case cse : lstVeh){
            System.debug(cse);
            System.debug(cse.DamagedVehicle__r.Model__c);
            System.debug(cse.DamagedVehicle__r.Make__c);
        }
        
    }
    /**
         * @description Find all accounts having a case and display by recordType.
         * @author Dhomah Bhoovanyu | 20/10/2022
         * @return String The managed object's name.
    **/
    public static void findAccWithCase(){
        List<Case> lstAccCse = [SELECT Account.Id, Account.Name, Account.RecordType.Id, Account.RecordType.DeveloperName FROM Case];
        Set<Case> setCse = new Set<Case>(lstAccCse);
        map<String, List<Account>> mapCse = new map<String, List<Account>>();
        for(Case cse: setCse){
            try{
                mapCse.get(cse.Account.RecordType.DeveloperName).add(new Account(Id=cse.Account.Id,Name=cse.Account.Name));
            }catch(Exception e){
                mapCse.put(cse.Account.RecordType.DeveloperName,New List<Account>{new Account(Id=cse.Account.Id,Name=cse.Account.Name)});
            }
        }
        System.debug(mapCse);
    }
    /**
         * @description Assign all accounts of region “North” having recordType 
         * ‘Customer’ and their related contacts to the manager.
         * Acceptance Criterias: 
            The accounts and contacts update must be seen on account and related 
            contact after execute anonymous.

         * @author Dhomah Bhoovanyu | 20/10/2022
         * @return String The managed object's name.
    **/
    public static void assignAccCust(){
        User usr = [SELECT Id,Name FROM User WHERE IsActive=TRUE AND UserRole.Name = 'Manager' AND Alias='nman' LIMIT 1];
        System.debug('Manager Id>>>'+usr);
        List<Account> lstAcc= [SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account WHERE Region__c = 'North' AND RecordType.Name='Individual'];
        System.debug('List>>>'+lstAcc);

        Set<Contact> setCon=new Set<Contact>();
        Set<Account> setAcc=new Set<Account>();
        for(Account acc: lstAcc){
            acc.OwnerId=usr.Id;
            setAcc.add(acc);
            for(Contact con : acc.Contacts){
                con.OwnerId=usr.Id;
                setCon.add(con);
            }
        }
        List<Contact> lstCon= new List<Contact>(setCon);
        List<Account> lstAccNew= new List<Account>(setAcc);
        database.update(lstCon);
        database.update(lstAccNew);
    }
    
    /**
         * @description /**
         * @description Title : Insert 10 accounts (RecordType: Customer 
         * and all the required fields need to be filled) and for each account, 
         * insert a contact (Address and phone must contain the same corresponding
         *  data as the account).
        Note: RecordTypeId must not be hardcoded

        * SAcceptance Criterias: 
            -Use for loop to build list of accounts
            -Use insert dml
            -The accounts should be accessible in the Account list view after creation
            -The contacts must be associated with its corresponding account

         * @author Dhomah Bhoovanyu | 20/10/2022
         * @return String The managed object's name.
    **/
    public static void insertAccs(){
        String RecordId=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        List<Account> lstAcc = new List<Account>();
        for(Integer i=0 ; i< 10; i++){
            lstAcc.add(new Account(Name='testing'+i, ShippingStreet='address'+i,Phone='555'+i));
        }
        insert(lstAcc);
        List<Contact> lstCon = new List<Contact>();
        Integer i=0;
        for(Account ac : lstAcc){
            lstCon.add(new Contact(LastName='testing Contact'+i,MailingStreet=ac.ShippingStreet,Phone=ac.Phone, AccountId=ac.Id));
            i++;
        }
        insert(lstCon);
    }

}