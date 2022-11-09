/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 08/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   07/11/2022   Akhilesh Ramchurn   Initial Version
 **/
@isTest
public with sharing class AP07_RetrieveInvoicesCaseControllerTest {
    @TestSetup
    static void testSetup() {
        List<User> lstUsers = new List<User>();
        // String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
        // // This code runs as the system user
        // Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        // User u = new User(
        //     Alias = 'standt',
        //     ProfileId = p.Id,
        //     Email = 'TestUser@spoonconsulting.dev',
        //     EmailEncodingKey = 'UTF-8',
        //     LastName = 'Testing',
        //     LanguageLocaleKey = 'en_US',
        //     LocaleSidKey = 'en_US',
        //     TimeZoneSidKey = 'America/Los_Angeles',
        //     UserName = uniqueUserName
        // );
        lstUsers = AP_DataFactory.createUsers(1);

        System.runAs(lstUsers[0]) {
            List<Case> lstCases = new List<Case>();
            // Case cse = new Case(Subject = 'Test', Status = 'payment');
            // lstCases.add(cse);
            lstCases = AP_DataFactory.createCases(1);
            insert (lstCases);

            List<Invoice__c> lstInvoice = new List<Invoice__c>();
            //Invoice__c inv = new Invoice__c(Case__c = lstCases[0].Id, AmountWithoutVat__c = 100);
            //lstInvoice.add(inv);
            lstInvoice = AP_DataFactory.createInvoices(1, lstCases[0].Id);
            insert lstInvoice;
        }

    }

    @isTest
    static void testInvoiceController() {
        List<Invoice__c> lstInvoice1 = new List<Invoice__c>();
        List<Invoice__c> lstInvoice2 = new List<Invoice__c>();
        List<Case> lstCase = new List<Case>();
        List<User> lstUser = new List<User>();

        lstUser = [SELECT Id FROM User WHERE LastName = 'Testing'];
        lstCase = [SELECT Id FROM Case];

        System.runAs(lstUser[0]) {
            Test.startTest();
            lstInvoice1 = [SELECT Id, Name, InvoiceDate__c, AmountWithVat__c, AmountWithoutVat__c FROM Invoice__c WHERE Case__c = :lstCase[0].Id ORDER BY CreatedDate DESC];
            lstInvoice2 = LC01_RetrieveInvoicesCaseController.getRelatedInvoices(lstCase[0].Id);
            Test.stopTest();

            // System.assertEquals(lstInvoice1[0].AmountWithoutVat__c, lstInvoice2[0].AmountWithoutVat__c, 'Value of AmountWithoutVat__c does not match');
            // System.assertEquals(1, lstInvoice1.size(), 'Num of invoices not equal to 1');
            System.assertNotEquals(2, lstInvoice1.size(), 'Num of invoices not equal to 1');
        }

    }
}