/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-08-2022   Bhoovanyu Dhomah   Initial Version
**/
@isTest
public with sharing class AP16_TestPJO_TEST {
    @isTest
    static void testgetAccountInfo(){
        AP15_MockHttpResponseGenerator mock = new AP15_MockHttpResponseGenerator();
        Test.setMock(HttpCalloutMock.class, mock);

        //call method to test
        //this causes a fake response to be sent
        // from the class that implements HttpCalloutMock
        // Id i = Id('0');
        // HttpResponse res = AP16_TestPJO.getAccountInfo2();
        // AP16_TestPJO.getAccountInfo(i);

        HttpResponse res = WS02_GetAccDet.updateAcc();

        System.debug('here1');
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = res.getBody();
        System.debug('here');
        System.debug('returned value '+actualValue);
        String expectedValue = '{"Website": "test.salesforce.com","UpsellOpportunity": "No","SLASerialNumber": "123456789","SLAExpirationDate": "2022-11-03","SLA": "Bronze","Region": "East","Mobile": "7612345","CustomerPriority": "Low","Rating": "Cold","Email Address": "test2@spoon.com"}';
        
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());

        Test.startTest();

        Test.stopTest();

    }
}