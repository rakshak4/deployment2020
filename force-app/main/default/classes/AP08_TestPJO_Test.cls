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
public with sharing class AP08_TestPJO_Test {
    @TestSetup
    static void testSetup() {
        insert AP_DataFactory.createAccounts(1);
    }

    @isTest
    private static void testGetAccountInfo() {
        Test.startTest();

        Account acc = [SELECT Id FROM Account LIMIT 1];

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        AP08_TestPJO.getAccountInfo(acc.Id);

        Test.stopTest();
    }
}