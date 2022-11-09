/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 08/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   08/11/2022   Akhilesh Ramchurn   Initial Version
 **/

@isTest
public with sharing class AP02_CaseStudy_Test {
    @TestSetup
    static void testSetup() {
        List<User> lstUsers = new List<User>();
        lstUsers = AP_DataFactory.createUsers(1);

        System.runAs(lstUsers[0]) {
            List<Account> lstAccounts = new List<Account>();
            lstAccounts = AP_DataFactory.createAccounts(2);
            lstAccounts[0].RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
            lstAccounts[1].RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Business').getRecordTypeId();
            insert (lstAccounts);

            List<Case> lstCases = new List<Case>();
            lstCases = AP_DataFactory.createCases(2);
            lstCases[0].AccountId = lstAccounts[0].Id;
            lstCases[1].AccountId = lstAccounts[1].Id;
            insert (lstCases);
        }
    }

    @isTest
    static void testUserStory2Controller() {
        AP02_CaseStudy.accountCase();
    }
}