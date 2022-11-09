/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   07/11/2022   Mehreen Jhummun   Initial Version
**/
@isTest
public with sharing class LC01_DisplayInvoicesControllerTest {
    @testSetup
    public static void testSetup()
    {
        User user = new User();
        user.email = 'mehreen@spoonconsulting.com';
        user.ProfileId = UserInfo.getProfileId();
        user.UserName = 'titibi@tibiz.com';  
        user.LastName='Jhummun';          
        user.Alias =  'TST1';
        user.TimeZoneSidKey = 'America/New_York';
        user.EmailEncodingKey = 'ISO-8859-1';
        user.LocaleSidKey = 'en_US';
        user.LanguageLocaleKey = 'en_US';
        insert(user);
        System.runAs(user){

        List<Account> LstAcc= new List<Account>();
        Account acc = new Account(Name='testingtesting',Region__c='North', 	Phone='999000');
        LstAcc.add(acc);
        insert LstAcc;

        List<Case> lstCas= new List<Case>();
        Case cas= new Case(Status='On hold',Origin='Phone',AccountId=LstAcc[0].Id);
        lstCas.add(cas);
        insert lstCas;

        // List<Contact> lstCon= new List<Contact>();
        // Contact con= new Contact(LastName='MJTestcontact', Phone='99999',AccountId=LstAcc[0].Id);
        // lstCon.add(con);
        // insert lstCon;

        List<Invoice__c> LstInv= new List<Invoice__c>();
        Invoice__c inv = new Invoice__c(Name='testInv',Case__c=lstCas[0].Id);
        LstInv.add(inv);
        insert LstInv;
       

        }
        System.debug(user.Id);
    }

    @isTest public static void Test()
    {

        System.debug('HIII');
    }
    
    @isTest public static void componentTest()
    {
        List<User> lstUsers = [SELECT Id, name FROM USER WHERE LastName='Jhummun'];

        //bizin call li encor acoz lahaut p store dan vitual database
        // List<Account> lstAcc= new List<Account>();
        List<Case> lstCas= new List<Case>();
        // List<Contact> lstCon= new List<Contact>();
        List<Invoice__c> lstInv= new List<Invoice__c>();


        System.runAs(lstUsers[0]) {
            //Test1
            // Test.startTest();
            // lstCas = [SELECT Id FROM Case WHERE Status ='On hold'];
            // lstInv = LC01_DisplayInvoicesController.getInvoices(lstCas[0].Id);
            // List<Invoice__c> lstInv2 = [
            //     SELECT Id
            //     FROM Invoice__c 
            //     WHERE Case__c =: lstCas[0].Id 
            //     ORDER BY CreatedDate DESC
            //   ];
            // Test.stopTest();

            // System.assertEquals(lstInv,lstInv2,'good');
            // System.assertEquals(1,lstInv2.size(),'good');

            Test.startTest();
            lstInv=LC01_DisplayInvoicesController.getInvoices('test');
            Test.stopTest();

            System.assert(lstInv.size() == 0, 'Invalid ID field: test');
        }

    }
}


        // lstUsr = [SELECT Id FROM User WHERE LastName = 'Jhummun'];
        // lstAcc = [SELECT Id FROM Account WHERE Name='testingtesting'];
        // lstCas = [SELECT Id FROM Case WHERE Id = :lstAcc[0].Id];
        // lstCon = [SELECT Id FROM Contact WHERE LastName='MJTestcontact'];
        // lstInv = [SELECT Id FROM Invoice__c WHERE Id = :lstCas[0].Id];