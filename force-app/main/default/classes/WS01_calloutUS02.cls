/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-07-2022   Ayman Rummun   Initial Version
**/
public with sharing class WS01_calloutUS02 {
    
    public static String getAccessToken()
    {
        system.debug('Entering in class');
        Account__mdt accountAPIGetToken = Account__mdt.getInstance('APIGetToken'); 
        String clientId = accountAPIGetToken.client_id__c;
        String clientSecret = accountAPIGetToken.client_secret__c;
        String username = accountAPIGetToken.username__c;
        String password = accountAPIGetToken.password__c;
        String access_Token;

        Http http = new Http();
        HttpRequest request = new HttpRequest();

        String endPoint =
        'https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=' +
        clientId +
        '&client_secret=' +
        clientSecret +
        '&username=' +
        username +
        '&password=' +
        password;
        request.setEndpoint(endPoint);
    
        // request.setEndpoint('https://login.salesforce.com/services/oauth2/token?');
        // request.setMethod('POST');

        // request.setHeader('Content-Type','application/x-www-form-urlencoded');        
        // request.setBody('grant_type=password&client_id=' + clientId + 
        //                 '&client_secret' + clientSecret+ 
        //                 '&username=' + username +
        //                 '&password=' + password); 


        request.setMethod('POST');

        //sending the json to the request body
        httpResponse response = http.send(request); 
        system.debug('## response:' + response);

        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug('## Successfully retrieving access token' );
            System.debug('>>>>>>>>>>'+(String)results.get('access_token'));
        } 
        
        return access_Token;
        //createConection(access_Token);
    }

    public static void createConection()
    {
        String access_Token = getAccessToken();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        // request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com');
        // request.setMethod('POST');

        // request.setHeader('Content-Type','application/x-www-form-urlencoded');

        request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_calloutUS02');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer ' + access_Token);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('Email__c: test2@spoon.com');


        HttpResponse response = http.send(request);
        system.debug('###### response:' + response);

        if (response.getStatusCode() == 200) {
        Map<String, Object> resultMap = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            system.debug('####### Successfully' );
            string  accessToken = (String)resultMap.get('access_token');
            string  instanceURL = (String)resultMap.get('instance_url');
        }
        else{
            system.debug('## response status :' + response.getStatus()); 
            system.debug('## response message :' + response.getBody()); 
         }
    }  
}