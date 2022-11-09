/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-07-2022   Ayman Rummun   Initial Version
**/
@isTest
public with sharing class LC01_DisplayInvoicesControllerTest {

    @TestSetup
    static void testSetup()
    {
        User user = new User();
        user.email = 'sam@spoonconsulting.dev';
        user.ProfileId = UserInfo.getProfileId();
        user.UserName = 'sam12345678@test.com';            
        user.Alias =  'TST1';
        user.TimeZoneSidKey = 'America/New_York';
        user.EmailEncodingKey = 'ISO-8859-1';
        user.LocaleSidKey = 'en_US';
        user.LanguageLocaleKey = 'en_US';
        user.LastName = 'sammy';

        insert user;
        Account acc = new Account(OwnerId = user.Id, Name='test 2', Phone='8888', Region__c='North');
        insert acc;
        Case cas= new Case(OwnerId = user.Id, AccountId=acc.Id, Status = 'Payment', Origin='Email');
        insert cas;
        Contact con = new Contact(OwnerId = user.Id, LastName='contact Test', AccountId = acc.Id, Email__c ='test@gmail.com');
        insert con;
        Invoice__c inv = new Invoice__c(
            OwnerId = user.Id,
            Account__c = acc.Id,
            Case__c = cas.Id, 
            Contact__c = con.Id, 
            AmountWithoutVat__c = 1000);     
        
        insert inv;

        // System.debug('#############User' + user);
        // System.debug('#############Account' + acc);
        // System.debug('#############Case' + cas);
        // System.debug('#############Contact' + con);
        // System.debug('#############Invoice' + inv);
    }


    @isTest static void testGetInvoice()
    {
        List<Case> lstCas = [SELECT Id FROM Case];
        List<Invoice__c> lstInv = LC01_DisplayInvoicesController.getInvoices(lstCas[0].Id);
        System.assertEquals(1, lstInv.size(), 'one invoice inserted');
        System.debug('Size of invoice list: ' + lstInv.size());
    }

    @isTest static void testErrorGetInvoice()
    {
        List<Case> lstCas = [SELECT Id FROM Case];
        List<Invoice__c> lstInv = LC01_DisplayInvoicesController.getInvoices(lstCas[0].Id);
        System.assertEquals(0, lstInv.size(), 'one invoice inserted');
        System.debug('Size of invoice list: ' + lstInv.size());
    }

    @isTest public static void testErrorgetInvoices(){
        List<Invoice__c> lstinv = [SELECT Name,Case__c,Account__c, Contact__c, AmountWithoutVat__c, AmountWithVat__c, LastPaymentDate__c, InvoiceDate__c  FROM Invoice__c  ORDER BY InvoiceDate__c DESC];
        Test.startTest();
       System.assertEquals('INV-014',lstinv[0].Name);
       System.debug(lstinv);
       Test.stopTest();
    }
        
}