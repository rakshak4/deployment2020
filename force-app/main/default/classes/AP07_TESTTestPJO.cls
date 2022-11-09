/**
 * @description       : 
 * @author            : Sambhav Bholah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Sambhav Bholah
**/
@isTest
public with sharing class AP07_TESTTestPJO {
    @TestSetup
    static void testSetup() {
        String recordTypeIdRetrieved = AP06_TestDataFactory.getAccountRecordTypeId('Business');
        List<Account> lstAccount = AP06_TestDataFactory.createAccount(recordTypeIdRetrieved);
        insert lstAccount; 

    }

    @isTest 
    public static void testAP07_TESTTestPJO(){
        system.debug('------------------TESTING STARTS------------------');

        List<Account> lstAccount = [SELECT Id FROM Account];
        Test.startTest();

        
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        //call method to test
        //this causes a fake response to be sent
        //from the class that implements HttpCalloutMock
        HttpResponse res = AP07_TestPJO.getAccountInfo(lstAccount[0].Id);

        //verify response received contains fake values
        // String contentType = res.getHeader('Content-Type');
        // System.assert(contentType == 'application/json');
        // String actualValue = res.getBody();
        // String expectedValue = '{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}';
        // system.assertEquals(actualValue, expectedValue);
        // system.assertEquals(200, res.getStatusCode());

        Test.stopTest();

        system.debug('------------------TESTING ENDS------------------');
    }
}