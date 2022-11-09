/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-08-2022   Asma Ghanty   Initial Version
**/
@isTest
private class AP11_calloutAccountTest {

    @TestSetup
    static void testSetup(){

        List<User> lstUsr = AP_TestDataFactory.createUser(1);
        insert lstUsr;

        List<Account> lstAccounts = AP_TestDataFactory.createAccount(1);
        insert lstAccounts;

        
    }
    @isTest static void testCallout(){

        List<Account> lstAccounts = [SELECT Id FROM Account];
        List<User> lstUsr = [SELECT Id FROM User];

        System.runAs(lstUsr[0]){
        
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

        Test.startTest();

        WS02_calloutAccount.getAccountInfo(lstAccounts[0].Id);

        Test.stopTest();

        // String contentType = res.getHeader('Content-Type');
        // System.assert(contentType == 'application/json');

        // String actualValue = res.getBody();
        // String expectedValue = '{\"accounts\":[{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}';
        // System.assertEquals(actualValue, expectedValue);
        // System.assertEquals(200, res.getStatusCode());
    }
}
    
}