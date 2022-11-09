/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   08/11/2022   Mehreen Jhummun   Initial Version
**/
@isTest
public with sharing class AP03_TestPJ0Test {

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

            AP03_TestPJO.getAccountInfo(lstAcc[0].Id);
        }

    }
       
}
    // @isTest static void testCallout()
    // {
    //     //activate web service
    //     Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

    //     //call method to test.
    //     //This causes a fake response to be sent
    //     //from the class that implements HttpCalloutMock.

    //     // HttpResponse res = AP03_TestPJO.getAccountInfo(1yy6y);
    //     AP03_TestPJO.getAccountInfo('Mehreen');

    // //     String contentType = res.getHeader('Content-Type');
    // //     System.assert(contentType == 'application/json');
    // //     String actualValue = res.getBody();
    // //     String expectedValue = '{"example":"test"}';
    // //     System.assertEquals(actualValue,expectedValue);
    // //     System.assertEquals(200,res.getStatusCode());
    // // }
    // }