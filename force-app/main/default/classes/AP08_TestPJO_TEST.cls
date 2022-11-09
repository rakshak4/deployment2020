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
public with sharing class AP08_TestPJO_TEST {

    @testSetup
    public static void testSetup(){

        List<User> lstUsr = AP_DataFactory.createUsers(1);
        System.runAs(lstUsr[0]) {
            insert AP_DataFactory.createAccounts(1);
        }
        
    }
    
    @isTest
    private static void testGetAccountInfo() {
        
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

        Account acc = [SELECT Id FROM Account LIMIT 1];
        AP08_TestPJO.getAccountInfo(acc.Id);

    }


}