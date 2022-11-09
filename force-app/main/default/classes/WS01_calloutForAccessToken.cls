/**
 * @description       : Fer ene appel a ene access token
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-07-2022   Asma Ghanty   Initial Version
**/
public with sharing class WS01_calloutForAccessToken {
 
        public static String getRelatedData(){
            
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            AccountCMD__mdt acc = AccountCMD__mdt.getInstance('APIGetToken');
            String access_token;
            String clientId = acc.client_id__c;
            String clientSecret=acc.client_secret__c;
            String username = acc.username__c;
            String password = acc.password__c;
            
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
            
            
            request.setMethod('POST');
                 

            HttpResponse response = http.send(request);
            // Parse the JSON response
            if (response.getStatusCode() == 200) {
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                System.debug('>>>>>>>>>>'+(String)results.get('access_token'));
            }
            return access_token;
}

public static void setAccessToken(){
    Http http = new Http();
    String access_token= getRelatedData();
            HttpRequest request = new HttpRequest();

            request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_calloutForAccessToken');
            request.setMethod('POST');

            request.setHeader('Authorization','Bearer' +access_token);
            request.setHeader('Content-Type','application/json;charset=UTF-8');

            request.setBody('{"Email__c": "test2@spoon.com"}');

            HttpResponse response = http.send(request);


            if (response.getStatusCode() == 200) {
            Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('########Successful');
            access_token = (String)resultMap.get('access_token');
            string  instanceURL = (String)resultMap.get('instance_url');
            }

            else{
                System.debug('NO RESULT');
            }

            



}
    }