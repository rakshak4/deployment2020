/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-09-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-07-2022   Chevish Boodhun   Initial Version
**/
public with sharing class AP07_AccountDetailsTiBiz {

    @future (callout=true)
    public static void fetchAccountDetails(Id accId) {

        Account acc = [SELECT Id, Email__c FROM Account WHERE ID = :accId];

        CM_APICalloutCredential__mdt credentials = CM_APICalloutCredential__mdt.getInstance('UserAPICredentials');
        String requestParams = '?grant_type=password&client_id=' + credentials.ClientID__c + '&client_secret=' + credentials.ClientSecret__c + '&username=' + credentials.Username__c + '&password=' + credentials.Password__c;       
        Http http = new Http();
        HttpRequest authRequest = new HttpRequest();
        authRequest.setEndpoint('https://login.salesforce.com/services/oauth2/token' + requestParams);
        authRequest.setMethod('POST');
        HttpResponse authResponse = http.send(authRequest);
        Map<String, Object> authResponseBody = (Map<String, Object>) JSON.deserializeUntyped(authResponse.getBody());
        String accessToken = (String) authResponseBody.get('access_token');

        http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"Email": "' + acc.Email__c + '"}');
        request.setMethod('POST');
        HttpResponse response = http.send(request);
        System.debug(response.getStatusCode());
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(results);
            acc.Rating = (String) results.get('Rating');
            acc.CustomerPriority__c = (String) results.get('CustomerPriority');
            acc.Mobile__c = (String) results.get('Mobile');
            acc.Region__C = (String) results.get('Region');
            acc.SLA__c = (String) results.get('SLA');
            acc.SLAExpirationDate__c = Date.valueOf((String) results.get('SLAExpirationDate'));
            acc.SLASerialNumber__c = (String) results.get('SLASerialNumber');
            acc.UpsellOpportunity__c = (String) results.get('UpsellOpportunity');
            acc.Website = (String) results.get('Website');
            update acc;
        }
        System.debug(acc);

    }

}