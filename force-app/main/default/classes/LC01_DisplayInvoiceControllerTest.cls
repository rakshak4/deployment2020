/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-07-2022   Bhavish Nundoo   Initial Version
**/
@isTest
public with sharing class LC01_DisplayInvoiceControllerTest {

    // @testSetup static void testSetup(){
    //     List<Account> lstAcc = new List<Account>();
    //     List<Contact> lstCon = new List<Contact>();
    //     // List<User> lstUsr = new List<User>();
    //     List<Case> lstCas = new List<Case>();
    //     List<Invoice__c> lstInv = new List<Invoice__c>();


    //     User user = new User();
    //     user.email = 'TestUser@spoonconsulting.dev';
    //     user.ProfileId = UserInfo.getProfileId();
    //     user.UserName = 'xrex@test.com';
    //     user.LastName=  'xrex@test.com';         
    //     user.Alias =  'TST1';
    //     user.TimeZoneSidKey = 'America/New_York';
    //     user.EmailEncodingKey = 'ISO-8859-1';
    //     user.LocaleSidKey = 'en_US';
    //     user.LanguageLocaleKey = 'en_US';
    //     //lstUsr.add(user);
    //     insert user;

    //     System.runAs(user){
    //     Account acc = new Account();
    //     acc.Name='Ashita';
    //     acc.Region__c='North';
    //     acc.BillingStreet='dhsfdh';
    //     lstAcc.add(acc);
    //     insert lstAcc;

    //     Contact con = new Contact();
    //     con.LastName='con1';
    //     con.Phone='6454934';
    //     con.AccountId=acc.Id;

    //     Case cas= new Case();
    //     cas.AccountId = acc.Id;
    //     cas.Status='Working';
    //     cas.Origin='Phone';
    //     lstCas.add(cas);
    //     insert lstCas;

    //     Invoice__c inv = new Invoice__c();
    //     inv.Case__c= cas.Id ;
    //     inv.AmountWithoutVat__c=150;
    //     lstInv.add(inv);
        
    //     insert lstInv;

    //     }
        
        
        
    // }

    @testSetup static void testSetup(){
        List<User> lstUsr = AP01_testDataFactory.createUser(5);
        insert lstUsr;
        System.runAs(lstUsr[0]){
            List<Account> lstAcc = AP01_testDataFactory.createAccount(5);
            insert lstAcc;

            List<Case> lstCas = AP01_testDataFactory.createCase(5,lstAcc);
            insert lstCas;

            List<Invoice__c> lstInv = AP01_testDataFactory.createInvoice(5,lstCas);
            insert lstInv;

        }


    }


    @isTest public static void testgetInvoices(){
        List<User> lstUsr = [SELECT ID, Name FROM User ] ;
        System.runAs(lstUsr[0]){
            //List<Invoice__c> lstinv = [SELECT Name,Case__c,Account__c, Contact__c, AmountWithoutVat__c, AmountWithVat__c, LastPaymentDate__c, InvoiceDate__c  FROM Invoice__c  ORDER BY InvoiceDate__c DESC];
                Test.startTest();
                List<Case> lstCas = [SELECT Id FROM Case];
                List<Invoice__c> lstinv =LC01_DisplayInvoicesController.getInvoices(lstCas[0].Id);
            // System.assertEquals('INV-100008',lstinv[0].Name);
            System.assertEquals(1,lstinv.size());
            System.debug(lstinv);
            Test.stopTest();

        }
        
        
    
    }


}