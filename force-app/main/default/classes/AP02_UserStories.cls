/**
 * @File Name          : AP01_UpdateAccount.cls
 * @Description        : Initialisation with VS Code
 * @Author             : Spoon Consulting
 * @Group              : 
 * @Last Modified By   : Chevish Boodhun
 * @Last Modified On   : 11-08-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0         20-10-2022               CBO         Initial Version
**/

public with sharing class AP02_UserStories {
    
    /**
     * @description US_APEX_01.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void userStory1() {

        List<Case> lstCse = [SELECT Id, DamagedVehicle__r.Name, DamagedVehicle__r.Make__c, DamagedVehicle__r.Model__c , DamageType__c FROM Case WHERE DamagedVehicle__c != NULL ORDER BY DamageType__c];
        System.debug(lstCse);
        System.debug(lstCse.size());

    }

    /**
     * @description US_APEX_02.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void userStory2() {

        List<Case> lstCse = [SELECT Id, AccountId FROM Case WHERE AccountId != NULL];
        Set<String> setAccountIds = new Set<String>();
        Map<String, List<Account>> mapAccounts = new Map<String, List<Account>>();

        for (Case cse : lstCse) {
            setAccountIds.add(cse.AccountId);
        }
        List<Account> lstAcc = [SELECT Name, RecordType.DeveloperName FROM Account WHERE Id IN :setAccountIds AND RecordTypeId != NULL];

        for (Account acc : lstAcc) {
            System.debug('CBO : ' + acc.RecordType.DeveloperName);
            if (!mapAccounts.containsKey(acc.RecordType.DeveloperName)) {
                mapAccounts.put(acc.RecordType.DeveloperName, new List<Account>());
            }
            mapAccounts.get(acc.RecordType.DeveloperName).add(acc);
        }

        System.debug(mapAccounts);
        System.debug(mapAccounts.size());

    }

    /**
     * @description US_APEX_03.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void userStory3() {

        List<User> lstUser = [SELECT Id FROM User WHERE Profile.Name = 'Manager'];
        Id managerId = lstUser[0].Id;

        List<Account> lstAcc = [SELECT Id FROM Account WHERE Region__c = 'North' AND RecordType.DeveloperName = 'Individual'];
        Set<Id> setAccId = new Set<Id>();
        for (Account acc : lstAcc) {
            setAccId.add(acc.Id);
            acc.OwnerId = managerId;
        }
        List<Contact> lstCon = [SELECT Id FROM Contact WHERE AccountId IN :setAccId];
        for (Contact con : lstCon) {
            con.OwnerId = managerId;
        }

        System.debug(lstAcc);
        System.debug(lstCon);

        if (lstAcc.size() > 0) {
            update lstAcc;
        }
        if (lstCon.size() > 0) {
            update lstCon;
        }

    }

    /**
     * @description US_APEX_04.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void userStory4() {

        String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        List<Account> lstAcc = new List<Account>();
        for (Integer i=0; i<10; i++) {
            Account acc = new Account(
                RecordTypeId = recordTypeId,
                Name = 'TestAcc ' + i,
                Phone = i + '',
                BillingStreet = 'llll',
                Region__c = 'South'
            );
            lstAcc.add(acc);
        }
        if (lstAcc.size() > 0) {
            insert lstAcc;
        }

        List<Contact> lstCon = new List<Contact>();
        for (Integer i=0; i<lstAcc.size(); i++) {
            Contact con = new Contact(
                AccountId = lstAcc[i].Id,
                FirstName = 'ConFName ' + i,
                LastName = 'ConLName ' + i,
                Phone = lstAcc[i].Phone,
                MailingStreet = lstAcc[i].BillingStreet
            );
            lstCon.add(con);
        }
        if (lstCon.size() > 0) {
            insert lstCon;
        }

    }

    /**
     * @description US_APEX_05.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void userStory5() {

        List<Account> lstAcc = [SELECT Id FROM Account WHERE CreatedDate = TODAY];
        List<Contact> lstCon = [SELECT Id FROM Contact WHERE CreatedDate = TODAY];

        if (lstCon.size() > 0) {
            delete lstCon;
        }
        if (lstAcc.size() > 0) {
            delete lstAcc;
        }

    }
}