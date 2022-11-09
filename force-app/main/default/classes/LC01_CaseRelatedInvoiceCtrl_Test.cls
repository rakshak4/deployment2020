/**
 * @description       : 
 * @author            : SAU
 * @group             : Spoon Consulting
 * @last modified on  : 31-10-2022
 * @last modified by  : SAU
**/
@isTest
public with sharing class LC01_CaseRelatedInvoiceCtrl_Test {
    @testSetup static void init(){
        //Create Test Data
        //Create User
        List<User> lstUsers = new List<User>();
        User userObj = new User();
        userObj.FirstName = 'Thai';
        userObj.LastName  = 'Chung';
        userObj.email = 'ThaiChung@RS.com';
        userObj.Phone = '51234567';

        lstUsers.add(userObj);
        AP_TestDataFactory.generateUsers(lstUsers);

        //Create Account
        Account accObj = new Account();
        accObj.Name              = 'TestAcc1';
        accObj.Type              = 'Customer - Direct';
        accObj.BillingCity       = 'San Francisco';
        accObj.BillingState      = 'CA';
        accObj.BillingPostalCode = '94087';
        accObj.BillingCountry    = 'US';
        accObj.Industry          = 'Energy';
        accObj.Rating            = 'Warm';
        accObj.Region__c         = 'North';
        insert accObj;


        //Create Case
        Case caseObj = new Case();
        caseObj.Type      = 'Mechanical';
        caseObj.Reason    = 'Breakdown';
        caseObj.Subject   = 'Ignition problems';
        caseObj.Priority  = 'High';
        caseObj.AccountId = accObj.Id;
        insert caseObj;

        //Create Invoice

        Invoice__c invoiceObj = new Invoice__c();
        invoiceObj.AmountWithoutVat__c = 1000.0;
        invoiceObj.Vat__c = 12.0;
        invoiceObj.LastPaymentDate__c =  date.parse('12/12/2022');
        invoiceObj.Case__c = caseObj.Id;
        insert invoiceObj;
    }

    @isTest
    public static void testGetRelatedInvoices(){
        List<Case> lstCases           = new List<Case>();
        List <Invoice__c> lstInvoices = new List <Invoice__c>();

        //Query user created
        List <User> lstUsers = [SELECT Id, name FROM USER WHERE LastName = 'Chung'];

        // Run code as user specified
        System.runas(lstUsers[0]){

            Test.startTest();
            lstCases = [SELECT Id FROM Case WHERE Type = 'Mechanical'];
            lstInvoices = LC01_CaseRelatedInvoiceCtrl.getRelatedInvoices(lstCases[0].Id);
            Test.stopTest();

            //Assertions
            System.assertEquals(lstInvoices.size(), 1);
            Assert.isNotNull(lstInvoices,'Null');
        }
    }

    /**
     * @description       : Negative testing 
     * @author            : PJO
     * @group             : Spoon Consulting
     * @last modified on  : 06-11-2022
     * @last modified by  : PJO
    **/
    @isTest
    public static void testErrorGetRelatedInvoices(){
        List<Case> lstCases           = new List<Case>();
        List <Invoice__c> lstInvoices = new List <Invoice__c>();

        //Query user created
        List <User> lstUsers = [SELECT Id, name FROM USER WHERE LastName = 'Chung'];

        // Run code as user specified
        System.runas(lstUsers[0]){

            Test.startTest();
            lstInvoices = LC01_CaseRelatedInvoiceCtrl.getRelatedInvoices('Test');
            Test.stopTest();

            //Assertions
            System.assert(lstInvoices.size() == 0, 'invalid ID field: test');
        }
    }
}