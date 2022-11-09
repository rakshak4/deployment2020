/**************************************************************************************
-- - Author        : Spoon Consulting
-- - Description   : AP03_SyncAccountInfo Class test
--
-- Maintenance History:
--
-- Date         Name  Version  Remarks
-- -----------  ----  -------  -------------------------------------------------------
-- 31-OCT-2022  HMO   1.0     Initial Version
--------------------------------------------------------------------------------------
**************************************************************************************/
@isTest
public with sharing class AP03_SyncAccountInfo_TEST {
    static List<User> lstUsers;
    static List<Account> lstAccounts;
    
    static{
        //instantiate collections
        lstUsers = new List<User>{
            new User(FirstName = 'Simba', LastName = 'Poumba')
        };
		AP_TestDataFactory.generateUsers(lstUsers);
        
        lstAccounts = new List<Account>();
        
        System.runAs(lstUsers[0]){
            lstAccounts.add(
            	new Account(Name = 'ashwagandha', Email__c = 'ashwagandha@trippy.za', Region__c = 'South')
            );
            insert lstAccounts;
        }
    }
    
    @isTest
    private static void testAccessToken(){
        System.runAs(lstUsers[0]){
            Test.startTest();
                MockCustomMetaData_TEST simulateMdt = new MockCustomMetaData_TEST();
                String mockData = '[{"ClientID__c" : "225255faca92585ab873ee092bce4280", "ClientSecret__c" : "82a27974f176902050b55585e1461a17","Endpoint__c" : "https://login.salesforce.com/services/oauth2/token",'+
                '"Password__c" : "CityCentre", "Token__c": "c7bb2bfbaae37e1ad4754d60af0be3b6", "Username__c": "TronLegacy"  }]';
                simulateMdt.setMetaData('SELECT Endpoint__c, ClientID__c, ClientSecret__c, Username__c, Password__c, Token__c FROM CalloutCredentials__mdt where DeveloperName = \'APIGetToken\'',
                 (List<CalloutCredentials__mdt>) JSON.deserialize(mockData, List<CalloutCredentials__mdt>.class));  
                
                MockApi testAccessToken = new MockApi();
            	testAccessToken.body = '{\"Result\": [{\"access_token\" : \"d27105e8e5870d76b0e38199aec1ba81\"},{\"instance_url\" : \"magikMushroom@trip.eu\"}],\"Status\":\"OK\"}';
                testAccessToken.statusCode = 200;
                Test.setMock(HttpCalloutMock.class, testAccessToken);
            	AP03_SyncAccountInfo.getAccessToken();
        	Test.stopTest();
        }
        
    }
    
    @isTest
    private static void testGetAccInfo(){
        System.runAs(lstUsers[0]){
            Test.startTest();
                MockCustomMetaData_TEST simulateMdt = new MockCustomMetaData_TEST();
                String mockData = '[{"ClientID__c" : "225255faca92585ab873ee092bce4280", "ClientSecret__c" : "82a27974f176902050b55585e1461a17", "Endpoint__c" : "https://login.salesforce.com/services/oauth2/token","Password__c" : "CityCentre", "Token__c": "c7bb2bfbaae37e1ad4754d60af0be3b6", "Username__c": "TronLegacy"  }]';
                simulateMdt.setMetaData('SELECT Endpoint__c, ClientID__c, ClientSecret__c, Username__c, Password__c, Token__c FROM CalloutCredentials__mdt where DeveloperName = \'APIGetToken\'', (List<CalloutCredentials__mdt>) JSON.deserialize(mockData, List<CalloutCredentials__mdt>.class));
                
                
                MockApi testGetAccInfo = new MockApi();
            	testGetAccInfo.body = '{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}';
                testGetAccInfo.statusCode = 200;
                Test.setMock(HttpCalloutMock.class, testGetAccInfo);
            	AP03_SyncAccountInfo.getAccountInfo(lstAccounts[0].Email__c);
        	Test.stopTest();
        }
        //to add asserts
        
    }
    
    //PJO
    public class MockHttpResponseGenerator implements HttpCalloutMock {        
        public HTTPResponse respond(HTTPRequest req) { 
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setStatusCode(200);
            res.setBody('{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}');
            return res; 
        }
    }

    @isTest
    private static void testGetAccInfo1(){
        System.runAs(lstUsers[0]){
            Test.startTest();
                // Set mock callout class 
                Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

                // Call method to test this causes a fake response to be sent from the class that implements HttpCalloutMock. 
            	AP03_SyncAccountInfo.getAccountInfo(lstAccounts[0].Id);
        	Test.stopTest();

        // Verify response received contains fake values
        //System.assertEquals(200, res.getStatusCode());
        }
    }

    @isTest
    private static void testSendAccInfo(){
        System.runAs(lstUsers[0]){
            Test.startTest();
                MockCustomMetaData_TEST simulateMdt = new MockCustomMetaData_TEST();
                String mockData = '[{"ClientID__c" : "225255faca92585ab873ee092bce4280", "ClientSecret__c" : "82a27974f176902050b55585e1461a17", "Endpoint__c" : "https://login.salesforce.com/services/oauth2/token","Password__c" : "CityCentre", "Token__c": "c7bb2bfbaae37e1ad4754d60af0be3b6", "Username__c": "TronLegacy"  }]';
                simulateMdt.setMetaData('SELECT Endpoint__c, ClientID__c, ClientSecret__c, Username__c, Password__c, Token__c FROM CalloutCredentials__mdt where DeveloperName = \'APIGetToken\'', (List<CalloutCredentials__mdt>) JSON.deserialize(mockData, List<CalloutCredentials__mdt>.class));
                
                
                MockApi testSendAccInfo = new MockApi();
            	testSendAccInfo.body = '{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}';
                testSendAccInfo.statusCode = 201;
                Test.setMock(HttpCalloutMock.class, testSendAccInfo);
            	//AP03_SyncAccountInfo.sendAccountInfo();
        	Test.stopTest();
        }
        //to add asserts
        
    }
    
	private class MockCustomMetaData_TEST {
        
        private void testCustomMetaData(){
            List<SObject> metaDataMap;
            Test.startTest();
              metaDataMap = new MockCustomMetaData().getMetaDataRecords('CalloutCredentials__mdt');
            Test.stopTest();
            System.assertEquals([SELECT Endpoint__c, ClientID__c, ClientSecret__c, Username__c, Password__c, Token__c FROM CalloutCredentials__mdt where DeveloperName = 'APIGetToken'].size(), metaDataMap.size());
        }
        
        private void setMetaData(String name, List<SObject> records){
            MockCustomMetaData m = new MockCustomMetaData();
            m.metaDataMap.put(name, records);
        }
	}
    
    
    private class MockCustomMetaData {
      	public Map<String, List<SObject>> metaDataMap = new Map<String, List<SObject>>();
        public List<SObject> getMetaDataRecords(String name){
            if (!metaDataMap.containsKey(name)){
                metaDataMap.put(name, Database.query(name));
            }
            return metaDataMap.get(name);
        }
     }
    
    private class MockAPI implements HttpCalloutMock { 
        private integer statusCode{get;set;}
        private String body {get;set;}
        
        public HTTPResponse respond(HTTPRequest req) { 
            HTTPResponse res = new HTTPResponse();
            res.setStatusCode(statusCode);
            res.setBody(body);
         
            return res; 
        }
    }

}