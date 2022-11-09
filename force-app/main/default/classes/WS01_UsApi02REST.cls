/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 07/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   07/11/2022   Souhayl Johar   Initial Version
**/


public with sharing class WS01_UsApi02REST {
    public static void WS01_UsApi02REST() {

Http http = new Http();
HttpRequest request = new HttpRequest();

AccountSetting__mdt accSetting = AccountSetting__mdt.getInstance('APIGetToken');

request.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id='+accSetting.ClientId__c+'&client_secret='+accSetting.ClientSecret__c+'&username='+accSetting.Username__c+'&password='+accSetting.Password__c);
System.debug(accSetting);
request.setMethod('POST');
request.setHeader('Content-Type', 'application/json;charset=UTF-8');
// Set the body as a JSON object
request.setBody('{"":""}');
HttpResponse response = http.send(request);
// Parse the JSON response
if(response.getStatusCode() != 201) {
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    System.debug(results);
} else {
    System.debug(response.getBody());
}


    }
}