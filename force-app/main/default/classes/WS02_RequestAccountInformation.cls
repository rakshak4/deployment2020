/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Jason Ramjaya
**/
public with sharing class WS02_RequestAccountInformation {
    public static HttpResponse GetAccessToken() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        APIGetToken__mdt accSetting = APIGetToken__mdt.getInstance('TiBiz');
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id='+accSetting.ClientId__c+'&client_secret='+accSetting.ClientSecret__c+'&username='+accSetting.Username__c+'&password='+accSetting.Password__c);
        request.setMethod('POST');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response

        return response;
    }

    public static void getAccountInformation(String email) {
        HttpResponse response = GetAccessToken();
        System.debug(response);
        if(response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(results.get('access_token'));

            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');

            
            request.setMethod('POST');
            request.setHeader('Authorization', 'Bearer ' + results.get('access_token'));
            request.setHeader('Accept', 'application/json');
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setBody('"Email" : "' + email + '"');

            HttpResponse getResponse = http.send(request);
            System.debug(getResponse.getStatusCode());
            if (getResponse.getStatusCode() == 200) {
                Map<String, Object> getResults = (Map<String, Object>) JSON.deserializeUntyped(getResponse.getBody());
                System.debug(getResults);
            }
        }
        
    }
}