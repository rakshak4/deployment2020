/**
 * @description       :
 * @author            : Ashita Gopaul
 * @group             :
 * @last modified on  : 11-08-2022
 * @last modified by  : Ashita Gopaul
 **/
@isTest
public with sharing class AP02_DisplayAccountsTest {
    @testSetup
    static void testSetup() {
        List<User> lstUsers = AP_TestDataFactory.createUser(1);
        insert lstUsers;
        System.runAs(lstUsers[0]) {
            List<Account> lstAcc = AP_TestDataFactory.createAccount(2);
            lstAcc[0].RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
            lstAcc[1].RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();
            lstAcc[0].OwnerId = lstUsers[0].Id;
            lstAcc[1].OwnerId = lstUsers[0].Id;

            insert lstAcc;

            List<Case> lstCas = AP_TestDataFactory.createCase(2);
            lstCas[0].AccountId = lstAcc[0].Id;
            lstCas[1].AccountId = lstAcc[1].Id;

            insert lstCas;
        }

    }

    @isTest static void testUseCase2() {
        Test.startTest();
        List<User> lstUser = [SELECT Id FROM User LIMIT 1];
        System.runAs(lstUser[0]) {
            AP02_DisplayAccounts.useCase2();
        }
        Test.stopTest();
    }
}