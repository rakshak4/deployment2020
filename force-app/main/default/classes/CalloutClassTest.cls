/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Ashita Gopaul
**/
@isTest
public with sharing class CalloutClassTest {
   @isTest static void testCallout(){
    //set mock callout class
    Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

    //call method to test
    //this causes a fake response to be sent
    //from the class that implements HttpCalloutMock

    //HttpResponse res= CalloutClass.getInfoFromExternalService();
    //String contentType = res.getHeader('Content-Type');
    //System.assert(contentType == 'application/json');
    //String actualValue=res.getBody();
    //String expectedValue='{"example":"test"}';
    //System.assertEquals(actualValue, expectedValue);
    //System.assertEquals(200,res.getStatusCode());
    List<Account> lstAcc=AP_TestDataFactory.createAccount(1);
    insert lstAcc;
    Test.startTest();
    AP03_TestPJO.getAccountInfo(lstAcc[0].Id);
    Test.stopTest();
    


   } 
}