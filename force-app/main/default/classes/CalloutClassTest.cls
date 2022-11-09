/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Jason Ramjaya
**/
@isTest
private with sharing class CalloutClassTest {
    @isTest static void testCallout() {
        // set mock callout class
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

        //call method to test.
        //This cause a fake response to be sent
        //from the class that implements HttpCalloutMock.
        List<Account> lstAcc = AP_TestDataFactory.createAccounts(1);
        lstAcc[0].Email__c = 'ashwagandha@trippy.za';
        insert lstAcc;

        HttpResponse res = AP04_TestPJO.getAccountInfo(lstAcc[0].Id);
        System.debug('Res ' + res);
        Map<String, Object> mapResult = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        System.debug('>> mapResult '+mapResult);

        //verify response received contains fake values
        //String contentType = res.getHeader('Content-Type');
        //System.assert(ContentType == 'application/json');
        //String actualValue = res.getBody();
        //String expectedValue = '{"example":"test"}';
        //System.assertEquals(actualValue, expectedValue);
        //System.assertEquals(200, res.getStatusCode());
    }
}