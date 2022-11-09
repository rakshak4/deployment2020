/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 07/11/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   07/11/2022   Narmeen Nehor   Initial Version
**/
public with sharing class WS01_GetInformationREST {
    public static HttpResponse makeCallout(){
        String access_token;

        AccountSetting__mdt AccountMdt = AccountSetting__mdt.getInstance('APIGetToken');
    
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=' + AccountMdt.clientId__c + '&client_secret=' + AccountMdt.clientsecret__c + '&username=' + AccountMdt.username__c + '&password=' + AccountMdt.password__c);
        request.setMethod('POST');
        HttpResponse response = http.send(request);

        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) 
        {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
           String accessToken = (String)results.get('access_token');
            System.debug(accessToken);
        }

        // request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');
        // request.setMethod('POST');
        // request.setHeader('Authorization', 'Bearer ' + accessToken);
        // request.setHeader('Content-Type', 'application/json;charset=UTF-8');


        return response ;
    }
}