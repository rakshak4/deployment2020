/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-07-2022   Keny Poisson   Initial Version
**/

@isTest
public with sharing class AP08_invoiceControllerTest {


    // @TestSetup
    // static void makeData(){

    //     System.debug('intialising...............');

    //     User user = new User();
    //     user.LastName='muahhhh';
    //     user.CommunityNickname='muahh29';
    //     //user.UserRoleId='South Agent';
    //     user.email = 'TestUser2@spoonconsulting.dev';
    //     user.ProfileId = UserInfo.getProfileId();
    //     user.UserName = 'duss@test.com';            
    //     user.Alias =  'duss';
    //     user.TimeZoneSidKey = 'America/New_York';
    //     user.EmailEncodingKey = 'ISO-8859-1';
    //     user.LocaleSidKey = 'en_US';
    //     user.LanguageLocaleKey = 'en_US';
    //     insert user;

    //     //run as user TST1

    //     System.runAs(user) {

    //     Case cas=new Case();
    //     cas.Origin='Email';
    //     cas.Status='Working';
    //     cas.Subject='Testing case from test class';
    //     insert cas;
    //     System.debug('Case.......'+cas);

    //     invoice__c inv=new invoice__c();
    //     inv.Case__c=cas.id;
    //     inv.AmountWithoutVat__c=150.00;
    //     insert inv;
    //     System.debug('invoice.......' + inv);

    //     Account acc= new Account(
    //         Name='Bob Leponge TEst',
    //         Region__c='North'

    //     );
    //     insert acc;

      
        

    //     }
        
    // }

    @TestSetup
    static void testDataBulk(){

        List <User> lstUser1=AP_TestDataFactory.createUser(5);
        insert lstUser1;
        System.debug('list of user on test setup' + lstUser1);

        System.runAs(lstUser1[0]){

        List <Case> lstCas=AP_TestDataFactory.createCase(5);
        insert lstCas;

        List <invoice__c> lstInv=AP_TestDataFactory.createInvoice(5,lstCas);
        insert lstInv;

    }

    }

    @isTest static void testInvoice(){


        List<Case> lstCas=new List<Case>();
        List<invoice__c> lstInv=new List<invoice__c>();
        List<User> lstUser=[SELECT ID, Name From USER WHERE LastName='muahhhh0'];
        System.debug('list of user' + lstUser);

        System.runAs(lstUser[0]){

            Test.StartTest();
            lstCas=[SELECT Id FROM Case WHERE Subject='Testing case from test class'];
            lstInv=AP08_invoiceController.getInvoices(lstCas[0].Id);

            Test.StopTest();
            assert.IsNotNull(lstInv,'PASS tess');
            System.assertEquals(1,lstInv.size(),'Pass Test');

        }
        
    }

    @isTest static void testAccountsHavingCase(){

        List<User> lstUser=[SELECT ID, Name From USER WHERE LastName='muahhhh0'];

        System.runAs(lstUser[0]){
            
            Test.StartTest();
            AP04_SFDC.accountsHavingCase();
            Test.StopTest();
        }

    }

}