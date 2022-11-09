/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Ashita Gopaul
**/
@isTest
public with sharing class AP_TestDataFactory {
    public static List<User> createUser(Integer numUser) {
        List<User> lstUsers = new List<User>();
        for (Integer i = 0; i < numUser; i++) {
            User user = new User();
            user.email = 'Ashita123@spoonconsulting.dev';
            user.ProfileId = UserInfo.getProfileId();
            user.UserName = 'Ashita'+i+'@test.com';
            user.Alias = 'TST1';
            user.TimeZoneSidKey = 'America/New_York';
            user.EmailEncodingKey = 'ISO-8859-1';
            user.LocaleSidKey = 'en_US';
            user.LanguageLocaleKey = 'en_US';
            user.CommunityNickname = 'TestUser0105';
            user.LastName = 'Gopaul'+i;
            lstUsers.add(user);
        }
        return lstUsers;
    }

    public static List<Account> createAccount(Integer numAccounts) {
        List<Account> lstAcc = new List<Account>();
        for (Integer i = 0; i < numAccounts; i++) {
            Account acc = new Account();
            acc.Name = 'Ashita'+i;
            acc.Phone = '1234567';
            acc.Mobile__c = '2345678';
            acc.Region__c = 'North';
            acc.BillingCity = 'asdfgrfnnfdk';
            //acc.OwnerId = user.Id;

            lstAcc.add(acc);
        }
        return lstAcc;
    }

    public static List<Case> createCase(Integer numCase) {
        List<Case> lstCase = new List<Case>();
        for (Integer i = 0; i < numCase; i++) {
            Case cse = new Case();
            //cse.AccountId = acc.Id;
            cse.Status = 'New';
            cse.Type = 'Mechanical';
            cse.Origin = 'Phone';
            lstCase.add(cse);
        }
        return lstCase;
    }

    public static List<Invoices__c> createInvoice (Integer numInvoice){
        List<Invoices__c> lstInvoices = new List<Invoices__c>();
        for(Integer i=0; i<numInvoice; i++){
            Invoices__c inv = new Invoices__c();
            //inv.Account__c = acc.Id;
            //inv.Case__c = cse.Id;
            lstInvoices.add(inv);
        }
        return lstInvoices;     
    }
}