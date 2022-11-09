/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-06-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class WS02_GetAccDet {
    // @future (callout=true)
    public static HttpResponse updateAcc(){
        // String email = acc.Email__c;
        String email ='test2@spoon.com';

        APICredentials__mdt mc = APICredentials__mdt.getInstance('CredentialsCaseStudy');

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token?');

        request.setBody('grant_type=password&client_id='+mc.client_id__c+'&client_secret='+mc.client_secret__c+'&username='+mc.username__c+'&password='+mc.password__c);
        request.setMethod('POST');

        System.debug('Id '+mc.client_id__c);
        // request.setMethod('POST');
            request.setTimeout(120000);
            request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        HttpResponse response = http.send(request);

        System.debug(response);
        Map<String, String> resultCallout = new Map<String, String>();
        // sObject obj = new sObject();
        if(response.getStatusCode() == 200) {
            System.debug(JSON.deserializeUntyped(response.getBody()));
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            String accessToken = (String)results.get('access_token');

            http = new Http();
            request = new HttpRequest();
            request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');
            request.setMethod('POST');
            request.setHeader('Authorization', 'Bearer '+accessToken);
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            // request.setBody({'email__c'+email});
            request.setBody('{"Email": "' +email+'"}');
            HttpResponse calloutResponse = http.send(request);
            System.debug(calloutResponse);

            // If the request is successful, parse the JSON response.
            if(calloutResponse.getStatusCode() == 200) {
                System.debug(calloutResponse);
                System.debug(calloutResponse.getBody());
                return calloutResponse;
                
                // resultCallout = (Map<String, String>)JSON.deserializeUntyped(calloutResponse.getBody());
                // obj = (sObject)JSON.deserializeUntyped(calloutResponse.getBody());
                // System.debug(JSON.deserializeUntyped(calloutResponse.getBody()));
            }

        }
        
        // return obj;
        

        
        // If the request is successful, parse the JSON response.
        // if(response.getStatusCode() == 200) {

            
        //     // Deserializes the JSON string into collections of primitive data types.
        //     Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        //     // Cast the values in the 'animals' key as a list
        //     Map<String, String> accounts = (Map<String, String>) results.get('account');
        //     // System.debug('Received the following animals:');
        //     // for(Object animal: animals) {
        //     //     System.debug(animal);
        //     // }
        //     List<Account> accId = [SELECT Id FROM Account WHERE Email__c=:email LIMIT 1];
        //     Account acc = new Account();
        //     acc.Id=accId[0].Id;
        //     acc.Rating = accounts.get('Rating');
        //     acc.CustomerPriority__c = accounts.get('CustomerPriority__c');
            
        //     database.update(acc); 
        // }
        // return response;
        HttpResponse resp = new HttpResponse();
        return resp;
    }
}