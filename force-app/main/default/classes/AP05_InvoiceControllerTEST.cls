/**
 * @description       :
 * @author            : Sambhav Bholah
 * @group             :
 * @last modified on  : 11-08-2022
 * @last modified by  : Sambhav Bholah
 **/
@isTest
//1. create fake data
//2. create fake user
//3.
public with sharing class AP05_InvoiceControllerTEST {
    //test via global varibles
    @TestSetup
    static void testSetup() {
        //initialise variables
        List<User> lstUsers = AP06_TestDataFactory.createUser();

        System.runAs(lstUsers[0]) {
            // The following code runs as user 'u'
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId());

            List<Case> lstCase = AP06_TestDataFactory.createCase();
            insert lstCase;
            List<Invoice__c> lstInvoice = AP06_TestDataFactory.createInvoice(lstCase);
            insert lstInvoice;
        }

    }

    //AP05_InvoiceControllerTEST.testInvoiceController()
    @isTest
    static void testInvoiceController() {
        List<Case> lstCase = new List<Case>();
        List<Invoice__c> lstInvoice = new List<Invoice__c>();
        List<Invoice__c> lstInvoice2 = new List<Invoice__c>();
        List<User> lstUsers = new List<User>();

        lstCase = [SELECT Id FROM Case];
        lstInvoice2 = [
            SELECT name, InvoiceDate__c, AmountWithVat__c, AmountWithoutVat__c, Contact__c
            FROM Invoice__c
            WHERE Case__c = :lstCase[0].Id AND Case__r.Status = 'Payment'
            ORDER BY CreatedDate DESC
        ];

        lstUsers = [SELECT Id FROM User WHERE LastName = 'Testing'];

        System.runAs(lstUsers[0]) {
            Test.startTest();
            lstInvoice = LC01_InvoiceController.getRelatedInvoices(lstCase[0].Id);
            system.debug('list inv2:');
            system.debug(lstInvoice2);
            system.debug('list inv1:');
            system.debug(lstInvoice);
            Test.stopTest();

            System.assertEquals(lstInvoice2[0].Name, lstInvoice[0].Name, 'its good');
            //size
            System.assertEquals(10, lstInvoice.Size(), 'size is good');
        }
    }
}