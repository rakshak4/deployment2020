/**
 * @description       :
 * @author            : Ashita Gopaul
 * @group             :
 * @last modified on  : 11-08-2022
 * @last modified by  : Ashita Gopaul
 **/
@isTest
public with sharing class InvoiceControllerTest {

     @testSetup static void testSetup() {
     List<User> lstUsers= AP_TestDataFactory.createUser(1);
     insert lstUsers;

     System.runAs(lstUsers[0]){
        List<Account> lstAcc= AP_TestDataFactory.createAccount(1);
        lstAcc[0].OwnerId= lstUsers[0].Id;
        insert lstAcc;
   
        List<Case> lstCas= AP_TestDataFactory.createCase(1);
        lstCas[0].AccountId= lstAcc[0].Id;
        insert lstCas;
   
        List<Invoices__c> lstInv= AP_TestDataFactory.createInvoice(1);
        lstInv[0].Account__c= lstAcc[0].Id;
        lstInv[0].Case__c= lstCas[0].Id;
        insert lstInv;
     }
    


    // static void testSetup() {

    //     User user = new User();
    //     user.email = 'Ashita@spoonconsulting.dev';
    //     user.ProfileId = UserInfo.getProfileId();
    //     user.UserName = 'Ashita@test.com';
    //     user.Alias = 'TST1';
    //     user.TimeZoneSidKey = 'America/New_York';
    //     user.EmailEncodingKey = 'ISO-8859-1';
    //     user.LocaleSidKey = 'en_US';
    //     user.LanguageLocaleKey = 'en_US';
    //     user.CommunityNickname = 'TestUser0105';
    //     user.LastName = 'Gopaul';
    //     insert user;

    //     System.runAs(user){

        
    //     Account acc = new Account();
    //     acc.Name = 'Ashita';
    //     acc.Phone = '1234567';
    //     acc.Mobile__c = '2345678';
    //     acc.Region__c = 'North';
    //     acc.BillingCity = 'asdfgrfnnfdk';
    //     acc.OwnerId = user.Id;
    //     insert acc;

    //     List<Case> lstCase = new List<Case>();
    //     Case cse = new Case();
    //     cse.AccountId = acc.Id;
    //     cse.Status = 'New';
    //     cse.Type = 'Mechanical';
    //     cse.Origin = 'Phone';
    //     lstCase.add(cse);
    //     if (lstCase.size() > 0) {
    //         insert lstCase;
    //     }

    //     List<Invoices__c> lstInvoices = new List<Invoices__c>();
    //     Invoices__c inv = new Invoices__c();
    //     inv.Account__c = acc.Id;
    //     inv.Case__c = cse.Id;
    //     lstInvoices.add(inv);
    //     if (lstInvoices.size() > 0) {
    //         insert lstInvoices;
    //     }
    //     }
     }
    @isTest static void testGetRelatedInvoices(){
        // User user=[SELECT Id FROM User WHERE UserName='Ashita@test.com' LIMIT 1];
        // System.debug(user);
        // Case cse=[SELECT Id FROM Case WHERE Origin='Phone' LIMIT 1];
        // System.debug(cse);
        // //List<Invoices__c> lstInvoices=[SELECT Id FROM Invoices__c WHERE Case__c=:cse.Id];
        // List<Invoices__c> lstInvoices=LC01_InvoiceController.getRelatedInvoices(cse.Id);
        // System.assertEquals(1, lstInvoices.size());
        Test.startTest();
        List<User> lstUser=[SELECT Id FROM User LIMIT 1];
        System.runAs(lstUser[0]){
            List<Case> lstCas= [SELECT Id FROM Case WHERE Origin='Phone' LIMIT 1];
            System.debug(lstCas);     
            List<Invoices__c> lstInv=LC01_InvoiceController.getRelatedInvoices(lstCas[0].Id); 
        System.assertEquals(1, lstInv.size());
        }
        Test.stopTest();
    }
}