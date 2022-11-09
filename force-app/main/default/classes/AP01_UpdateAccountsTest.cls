/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
@isTest
public with sharing class AP01_UpdateAccountsTest {
    @TestSetup
    static void makeData(){
        User user= AP_DataFactory.createUser(1)[0];
        user.FirstName='Tim';
        user.LastName='Jones';
        user.Username='TimJones@Test.com';
        insert user;
        System.runAs(user){
            List<Account> lstAcc= AP_DataFactory.createAccounts(2);
            lstAcc[0].Name='Account test1';
            lstAcc[0].RecordTypeId=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();
            lstAcc[1].Name='Account test2';
            lstAcc[0].RecordTypeId= Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();
            insert lstAcc;

            List<Case> lstCas = AP_DataFactory.createCases(6);
            for(Integer i=0;i<3;i++){
                lstCas[i].AccountId=lstAcc[0].Id;
            }
            for(Integer i=3;i<6;i++){
                lstCas[i].AccountId=lstAcc[1].Id;
            }
            insert lstCas;
        }
    }

    @isTest
    static void testGetAccountsWithCase(){
        User user= [SELECT Id FROM User WHERE Username=:'TimJones@Test.com'];
        System.runAs(user){
            Test.startTest();
                AP01_UpdateAccount.getAccountsWithCase();

                List<Case> lstCas = [SELECT ID FROM Case];
                System.debug(lstCas);
                delete lstCas;

                List<Account> lstAcc = [SELECT ID FROM Account];
                delete lstAcc;
                AP01_UpdateAccount.getAccountsWithCase();
            Test.stopTest();
        }
    }
}