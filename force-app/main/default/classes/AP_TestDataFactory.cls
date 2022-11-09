/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-08-2022   Asma Ghanty   Initial Version
**/
@isTest
public with sharing class AP_TestDataFactory {

    public static List<User> createUser(Integer numOfUsers){
        List<User> lstUsers = new List<User>();
        User asma = new User();

        for (Integer i = 0; i < numOfUsers; i++){
        //create user
        asma.email = 'TestUser@spoonconsulting.dev';
        asma.ProfileId = UserInfo.getProfileId();
        asma.UserName = 'Tes097t@test.com';
        asma.LastName = 'Testing';
        asma.Alias = 'TST1';
        asma.TimeZoneSidKey = 'America/New_York';
        asma.EmailEncodingKey = 'ISO-8859-1';
        asma.LocaleSidKey = 'en_US';
        asma.LanguageLocaleKey = 'en_US';

        lstUsers.add(asma);
        }
        return lstUsers;

    }

    public static List <Case> createCase(Integer numOfCase){
        List<Case> lstCas = new List<Case>();
        for (Integer i = 0; i < numOfCase; i++){
            Case caseObj = new Case();
            caseObj.Origin = 'Phone';
            caseObj.Status = 'Old';
        
            lstCas.add(caseObj);
        }
    
        return lstCas;
    }

    public static List <Invoices__c> createInvoice(Integer numOfInv){
        List<Invoices__c> lstInvoices = new List<Invoices__c>();
        for (Integer i = 0; i < numOfInv; i++){
            Invoices__c invObj = new Invoices__c();
            invObj.AmountWithoutVat__c = 20;
        
        lstInvoices.add(invObj);
        }
    
    return lstInvoices;

    }

    public static List <Account> createAccount(Integer numOfAccts){
        List<Account> lstAccts2 = new List<Account>();
        for (Integer i = 0; i < numOfAccts; i++){
            Account acctObj = new Account();
            acctObj.Name = 'Pakner';
            acctObj.BillingStreet = 'street 2';
            acctObj.BillingCity = 'Port Louis';
            acctObj.BillingCountry = 'Mauritius';
            acctObj.Phone='3031234';
            acctObj.Region__c='North';

            lstAccts2.add(acctObj);
        }
    
    return lstAccts2;

    }
}