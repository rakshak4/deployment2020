/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 08/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   08/11/2022   Akhilesh Ramchurn   Initial Version
 **/
public with sharing class AP_DataFactory {
    public static List<Invoice__c> createInvoices(Integer numInvoices, Id caseId) {
        List<Invoice__c> lstInvoices = new List<Invoice__c>();

        for (Integer i = 0; i < numInvoices; i++) {
            Invoice__c inv = new Invoice__c();
            inv.Case__c = caseId;
            inv.AmountWithoutVat__c = 100;

            lstInvoices.add(inv);
        }

        return lstInvoices;
    }

    public static List<User> createUsers(Integer numUsers) {
        List<User> lstUsers = new List<User>();

        for (Integer i = 0; i < numUsers; i++) {
            User usr = new User();
            usr.Alias = 'standt';
            usr.ProfileId = UserInfo.getProfileId();
            usr.Email = 'TestUser@spoonconsulting.dev';
            usr.EmailEncodingKey = 'UTF-8';
            usr.LastName = 'Testing';
            usr.LanguageLocaleKey = 'en_US';
            usr.LocaleSidKey = 'en_US';
            usr.TimeZoneSidKey = 'America/Los_Angeles';
            usr.UserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';

            lstUsers.add(usr);
        }

        return lstUsers;
    }

    public static List<Case> createCases(Integer numCases) {
        List<Case> lstCases = new List<Case>();

        for (Integer i = 0; i < numCases; i++) {
            Case cse = new Case();
            cse.Subject = 'Test';
            cse.Status = 'payment';

            lstCases.add(cse);
        }

        return lstCases;
    }

    public static List<Account> createAccounts(Integer numAccounts) {
        List<Account> lstAccs = new List<Account>();

        for (Integer i = 0; i < numAccounts; i++) {
            Account acc = new Account();
            acc.Name = 'Coco' + numAccounts;
            acc.Phone = '2314322';
            acc.BillingStreet = 'Flacq';
            acc.Region__c = 'North';

            lstAccs.add(acc);
        }

        return lstAccs;
    }
}