/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-08-2022   Keny Poisson   Initial Version
**/
@isTest
public with sharing class CalloutClassTest {

    @TestSetup
    static void testDataBulk(){

        //create user
        List <User> lstUser1=AP_TestDataFactory.createUser(5);
        insert lstUser1;
        System.debug('list of user on test setup' + lstUser1);

        //run as user position 0
        System.runAs(lstUser1[0]){
        //create 5 accouunt
        List <Account> lstAcc=AP_TestDataFactory.createAccount(5);
        insert lstAcc;
    }

    }

    @isTest static void testCallout(){

        //select account and all user
        List <Account> lstAcc=[Select Id,Name From Account];
        List<User> lstUser=[SELECT ID, Name From USER WHERE LastName='muahhhh0'];
        System.debug('list of user' + lstUser);

        System.runAs(lstUser[0]){
            
        Test.StartTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        //HttpResponse res= AP03_TestPJO.getAccountInfo(lstAcc[0].Id);
        AP03_TestPJO.getAccountInfo(lstAcc[0].Id);
        //String contentType=res.getHeader('Content-Type');
        // System.assert(contentType=='application/json');
        // String actualValue=res.getBody();
        // String expectedValue='{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}';
        // System.assertEquals(actualValue,expectedValue);
        // System.assertEquals(200,res.getStatusCode());
        Test.StopTest();

        }
        
    }
    
}