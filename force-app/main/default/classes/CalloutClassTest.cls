/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-08-2022   Bhavish Nundoo   Initial Version
**/
@isTest
public  class CalloutClassTest {
    @testSetup static void testSetup(){
            List<Account> lstAcc = AP01_testDataFactory.createAccount(1);
            insert lstAcc;
    }
    @isTest static void testCallout(){
        List<Account> lstAcc= [SELECT Id, Name FROM Account];
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

        AP03_TestPJO.getAccountInfo(lstAcc[0].Id);

        // String contentType =res.getHeader('Content-Type');
        // System.assert(contentType =='application/json');
        // String actualValue = res.getBody();
        String expectedValue = '{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}';
        // System.assertEquals(actualValue, expectedValue);
        // System.assertEquals(200, res.getStatusCode());
        Test.stopTest();

       }
    
}