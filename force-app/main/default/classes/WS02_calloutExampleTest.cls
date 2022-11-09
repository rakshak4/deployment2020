/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-08-2022   Ayman Rummun   Initial Version
**/
@isTest
public with sharing class WS02_calloutExampleTest {
    @TestSetup
    static void setup(){

        List<User> lstuser = AP_TestDataFactory.createUser(1);
        INSERT lstuser;

        List<Account> lstAcc = AP_TestDataFactory.createAccount(1);
        INSERT lstAcc;
        
    }
    @isTest
    public static void testCallout()
    {
        List<User> lstuser = [SELECT Id FROM User];

        System.runas(lstuser[0])
        {
            List<Account> lstAcc = [SELECT Id FROM Account];
        
            //set mock callout class
            //set mock - pe activate sa class, li pou repon nou ban kitchose ki ena dan class la
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

            WS02_calloutExample.getAccountInfo(lstAcc[0].Id);
        }

    }
       
}