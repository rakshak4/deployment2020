/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-08-2022   Chevish Boodhun   Initial Version
**/
@isTest
public with sharing class AP02_UserStories_TEST {
    
    @testSetup
    private static void testSetup() {

        List<User> lstUsr = AP_DataFactory.createUsers(1);
        insert lstUsr;

        System.runAs(lstUsr[0]) {
            List<Account> lstAcc = AP_DataFactory.createAccounts(2);
            lstAcc[0].RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
            lstAcc[1].RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Business').getRecordTypeId();
            insert lstAcc;

            List<Case> lstCse = AP_DataFactory.createCases(2);
            lstCse[0].AccountId = lstAcc[0].Id;
            lstCse[1].AccountId = lstAcc[1].Id;
            insert lstCse;
        }

    }

    @isTest
    private static void userStory2Test() {

        AP02_UserStories.userStory2();

    }

}