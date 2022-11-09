/**
 * @description       : 
 * @author            : Sambhav Bholah
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Sambhav Bholah
**/
public with sharing class WS01_RequestNewAccountsREST {
    // WS01_RequestNewAccountsREST.requestAccessToken(

    public static HttpResponse requestAccessToken(){
        //search for access token
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        APIGetToken__mdt customMetadata = APIGetToken__mdt.getInstance('tibiz');
        system.debug(customMetadata);

        String link = 'https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=' + customMetadata.consumerKey__c +'&client_secret=' + customMetadata.consumerSecret__c + '&username=' + customMetadata.username__c +  '&password=' + customMetadata.password__c;
        request.setEndpoint(link);
        request.setMethod('POST');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }

        return response;
    }  

    public static HttpResponse sendRequestForAccounts(String email) {
        
        //WS01_RequestNewAccountsREST.sendRequestForAccounts();
        HttpResponse accessToken = requestAccessToken();
        system.debug(accessToken);

        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(accessToken.getBody());

        system.debug(results.get('access_token'));
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');
        request.setMethod('POST');

        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        String token2 = '00D8d0000061bOA!AR8AQMIzVKDcEufaQVjPA_i2jay5hRfVUnCEsWNODqR50qXJOlk1UoJt5S3g.B82VDA987WuRi8PyX4XmpqSvqv1DaOGe34j';
        request.setHeader('Authorization', 'Bearer ' + token2); 
        //results.get('access_token')
        
        //"Email" :  "test2@spoon.com"
        request.setBody('{ "Email" : "' + email + '" }');

        HttpResponse response = http.send(request);
        // Parse the JSON response

        if(response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }

        return response;
    }
}