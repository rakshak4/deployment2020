/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-07-2022   Keny Poisson   Initial Version
**/
public with sharing class AP11_consumeWebServices {
    
public static String getAccessToken(){


    //get custom metadata

    AccountCredentials__mdt mc = AccountCredentials__mdt.getInstance('AccountCredential');
    String username=mc.username__c;
    String password=mc.password__c;
    String consumerKey= mc.clientId__c;
    String consumerSecret=mc.clientSecret__c;


    System.debug('pass' + password);
    System.debug('username'+ username);

    //to get access token

    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id='+consumerKey+'&client_secret='+consumerSecret+'&username='+username+'&password='+password);
    request.setMethod('POST');
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    HTTPResponse res=http.send(request);
    System.debug(res);

    return res.getBody();

    // //Call to the WS
    // request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com');
    // request.setMethod('GET');
    // request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    // HTTPResponse ress=http.send(request);

}

public static void getAccountDetails(){

    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');
    req.setMethod('POST');
    Map<String, Object> resultMap = (Map<String, Object>)JSON.deserializeUntyped(getAccessToken());
    string  accessToken = (String)resultMap.get('access_token');
    System.debug('Access Toke: ' + accessToken);
    // string token = (String)getAccessToken().get('access_token');

    req.setHeader('Authorization', 'Bearer ' + accessToken);
    req.setHeader('Content-Type', 'application/json;charset=UTF-8');
    req.setHeader('Content-Length', '0');
    Http http = new Http();
    HTTPResponse res = http.send(req);
    System.debug(res.getBody());
  }


}