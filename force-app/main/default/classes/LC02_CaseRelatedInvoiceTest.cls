/**
 * @description       :
 * @author            : Asma Ghanty
 * @group             :
 * @last modified on  : 11-08-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-07-2022   Asma Ghanty   Initial Version
 **/
@isTest
public with sharing class LC02_CaseRelatedInvoiceTest {
  @TestSetup
  static void testSetup() {
    List<User> lstUser = new List<user>();
    User user = new User();

    //create user
    user.email = 'TestUser@spoonconsulting.dev';
    user.ProfileId = UserInfo.getProfileId();
    user.UserName = 'Tes097t@test.com';
    user.LastName = 'Testing';
    user.Alias = 'TST1';
    user.TimeZoneSidKey = 'America/New_York';
    user.EmailEncodingKey = 'ISO-8859-1';
    user.LocaleSidKey = 'en_US';
    user.LanguageLocaleKey = 'en_US';

    insert (user);

    System.runAs(user) {

        //inserts into case
      List<Case> lstCas = new List<Case>();
      Case newCas = new Case(
        Origin = 'New',
        Status = 'Phone',
        OwnerId = user.Id
      );
      lstCas.add(newCas);
      insert lstCas;

      //inserts into invoice
      List<Invoices__c> lstInv = new List<Invoices__c>();
      Invoices__c newInv = new Invoices__c(
        AmountWithoutVat__c = 10,
        Case__c = lstCas[0].Id,
        OwnerId = user.Id
      );
      lstInv.add(newInv);
      insert newInv;
    }

  }

  @isTest
  public static void componentTest() {

    User[] asma = AP_TestDataFactory.createUser(1);
    Case[] caseObj = AP_TestDataFactory.createCase(1);
    Invoices__c[] invObj = AP_TestDataFactory.createInvoice(1);

    List<User> lstUser = new List<User>();
    List<Case> lstCase = new List<Case>();
    List<Invoices__c> lstInvoice = new List<Invoices__c>();

    lstUser = [SELECT Id FROM User];

    System.runAs(lstUser[0]) {
        
      Test.startTest();

      lstCase = [SELECT Id FROM Case];
      System.debug('Results:' +lstCase);
      lstInvoice = LC02_CaseRelatedInvoiceCtrl.getInvoices(lstCase[0].Id);
    //   List<Invoices__c> lstInv2 = [
    //     SELECT Name
    //     FROM Invoices__c
    //     WHERE Case__c = :lstCase[0].Id
    //     ORDER BY CreatedDate DESC
      //];
      Test.stopTest();

     // System.assertEquals(lstInvoice, lstInv2, 'good');
      System.assertEquals(1, lstInvoice.size(), 'good');
    }

  }
}