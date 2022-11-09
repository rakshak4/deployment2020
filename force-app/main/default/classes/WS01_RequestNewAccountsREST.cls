/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 07/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   07/11/2022   Akhilesh Ramchurn   Initial Version
 **/
public with sharing class WS01_RequestNewAccountsREST {
    public static HttpResponse requestAccessToken() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        APIGetToken__mdt mc = APIGetToken__mdt.getInstance('TiBiz');
        //  system.debug(mc);

        String accessTokenRequest =
            'https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=' +
            mc.ConsumerKey__c +
            '&client_secret=' +
            mc.CustomerSecret__c +
            '&username=' +
            mc.Username__c +
            '&password=' +
            mc.Password__c;
        request.setEndpoint(accessTokenRequest);

        // system.debug(accessTokenRequest);

        request.setMethod('POST');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }

    public static HttpResponse sendRequestForAccount(String email) {
        HttpResponse accessTokenResponse = requestAccessToken();

        System.debug(accessTokenResponse);

        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(accessTokenResponse.getBody());

        //system.debug(results.get('access_token'));
        String accessToken = (String) results.get('access_token');
        System.debug(accessToken);

        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');

        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Accept', 'application/json');
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        request.setBody('{"Email" : "' + email + '" }');

        request.setMethod('POST');

        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }
}