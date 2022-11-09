/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
@isTest
public with sharing class AP08_TestPJOTest {
    @TestSetup
    static void makeData(){
        User user = AP_DataFactory.createUser(1)[0];
        user.FirstName='fname';
        user.LastName='lname';
        user.Username='testUsername@CaseStudy.com';
        insert user;

        System.runAs(user){
            Account acc= AP_DataFactory.createAccounts(1)[0];
            acc.Name='Account test';
            acc.Email__c='ashwagandha@trippy.za';
            insert acc;
        }    
    }

    @isTest
    public static void testGetAccountInfo(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        User user = [Select Id From User Where Username='testUsername@CaseStudy.com'][0];
        System.runAs(user){
            Test.startTest();
                Id accId =[SELECT Id FROM Account][0].Id;
                HttpResponse res= AP08_TestPJO.getAccountInfo(accId);
                try {
                    AP08_TestPJO.getAccountInfo(new Account().Id);   
                } catch (Exception e) {
                    System.assertEquals('List index out of bounds: 0', e.getMessage());
                }                             
            Test.stopTest();
            System.assertEquals(res.getStatusCode(), 200);
            System.assertEquals(res.getHeader('Content-Type'), 'application/json');
            //Map<String, Object> mapResult = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            System.assertEquals(res.getBody(), '{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}');
        }
        
    }
}