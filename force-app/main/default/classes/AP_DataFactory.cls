/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
@isTest
public with sharing class AP_DataFactory {
    public static List<User> createUser(Integer numUsers){
        List<User> lstUsr= new List<User>();
        for(Integer i=0;i<numUsers;i++){
            User user= new User();        
            user.CommunityNickname='test';
            user.Email = 'TestUser@spoonconsulting.dev';
            user.ProfileId = UserInfo.getProfileId();                 
            user.Alias =  'TST1';
            user.TimeZoneSidKey = 'America/New_York';
            user.EmailEncodingKey = 'ISO-8859-1';
            user.LocaleSidKey = 'en_US';
            user.LanguageLocaleKey = 'en_US';    
            user.IsActive= true;
            lstUsr.add(user);
        }
        return lstUsr;
    }

    public static List<User> createUserProfileManager(Integer numManagers){
        return null;
    }

    public static List<Account> createAccounts(Integer numAccounts){
        List<Account> lstAcc = new List<Account>();
        for(Integer i=0;i<numAccounts;i++){
            Account acc = new Account(Region__c='North',Phone='213',BillingCity='Town');
            lstAcc.add(acc);
        }
        return lstAcc;
    }

    public static List<Case> createCases(Integer numCases){
        List<Case> lstCas = new List<Case>();
        for(Integer i=0;i<numCases;i++){
            Case cas = new Case(Status='New',Origin='Phone');
            lstCas.add(cas);
        }
        return lstCas;
    }
    

    public static List<Invoice__c> createInvoices(Integer numInvoices){
        List<Invoice__c> lstInv = new List<Invoice__c>();
        for(Integer i=0;i<numInvoices;i++){
            Invoice__c inv = new Invoice__c();
            lstInv.add(inv);
        }
        return lstInv;
    }

}