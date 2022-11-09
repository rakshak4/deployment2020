@isTest
public with sharing class AP02_SendEmail_TEST {
    @isTest public static void TestsentEmailToContact() {
        //create test data
        List <User> lstUsers = AP_TestDataFactory.createUsers(2);
        lstUsers[0].FirstName = 'Rose';
        lstUsers[0].LastName  = 'Juha';
        lstUsers[0].Email     = 'Rose@mail.com';

        lstUsers[1].FirstName = 'Pinky';
        lstUsers[1].LastName  = 'Wawa';
        lstUsers[1].Email     = 'Pinky@mail.com';

        insert lstUsers;

        // Run code as user specified
        System.runas(lstUsers[0]){

            List <Account> lstAccs = AP_TestDataFactory.createAccs(1);
            insert lstAccs;

            List <Contact> lstContacts = AP_TestDataFactory.createContacts(1);
            lstContacts[0].AccountId  = lstAccs[0].Id;
            lstContacts[0].LeadSource = 'Purchased List';
            lstContacts[0].Department = 'Internal Operations';
            lstContacts[0].Email      = 'test@mail.com';
            insert lstContacts;

            List<Case> lstCases = AP_TestDataFactory.createMechanicalCases(1);
            lstCases[0].AccountId = lstAccs[0].Id;
            insert lstCases;

            List <Invoice__c> lstInv = AP_TestDataFactory.createInvoices(1);
            lstInv[0].Case__c    = lstCases[0].Id;

            insert lstInv;

            Test.startTest();
                try{
                    System.debug('LstInvoice :' + lstInv);
                    AP02_SendEmail.sentEmailToContact(lstInv);
                }
                catch(Exception ex){
                    System.debug('Exception :' + ex.getmessage());
                } 
            Test.stopTest();

        }
    }
}