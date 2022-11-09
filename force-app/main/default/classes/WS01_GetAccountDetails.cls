/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Ashita Gopaul
**/
public with sharing class WS01_GetAccountDetails {
    
    public static void GetToken() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        APIGetToken__mdt token = APIGetToken__mdt.getInstance('AccessToken');
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id='+token.ClientId__c+'&client_secret='+token.ClientSecret__c+'&username='+token.Username__c+'&password='+token.Password__c+'');        
        HttpResponse response = http.send(request);
        System.debug(response);
// If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        System.debug(results);     
        }       
    }

    public static void GetCallout(){

    }
}