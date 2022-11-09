/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Jason Ramjaya
**/
@isTest
public with sharing class AP_TestDataFactory {
    public static List<User> createUsers(Integer numUser) {
        List<User> lstUser = new List<User>();

        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        for(Integer i = 0; i < numUser; i++) {
            User newUser = new User(Alias = 'newUser' + i, Email='janother'+i+'@gmail.com',
            EmailEncodingKey='UTF-8', LastName='Testing' + i, LanguageLocaleKey='en_US',
            LocaleSidKey='en_US', ProfileId = p.Id,
            TimeZoneSidKey='America/Los_Angeles', UserName='jesr'+i+'@gmail.com');

            lstUser.add(newUser);
        }
        
        return lstUser;
    }

    public static List<Account> createAccounts(Integer numAcc) {
        List<Account> lstAcc = new List<Account>();

        for(Integer i = 0; i < numAcc; i++) {
            Account acc = new Account(Name='Account '+i, Phone='14917523', Region__c='North', BillingCity='Morc St Andre');

            lstAcc.add(acc);
        }
        
        return lstAcc;
    }

    public static List<Case> createCases(Integer numCase) {
        List<Case> lstCase = new List<Case>();

        for(Integer i = 0; i < numCase; i++) {
            Case cas = new Case(Status='New');

            lstCase.add(cas);
        }
        
        return lstCase;
    }

    public static List<Invoices__c> createInvoices(Integer numInv) {
        List<Invoices__c> lstInvoices = new List<Invoices__c>();

        for(Integer i = 0; i < numInv; i++) {
            Invoices__c inv = new Invoices__c();

            lstInvoices.add(inv);
        }
        
        return lstInvoices;
    }

}