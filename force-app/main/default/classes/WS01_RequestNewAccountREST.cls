/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   07/11/2022   Mehreen Jhummun   Initial Version
**/
public with sharing class WS01_RequestNewAccountREST {

    public static String makeGetCallout(){
    
        CM_Account__mdt mc = CM_Account__mdt.getInstance('APIGetToken');
        String accesstoken;

        Http http = new Http();
        HttpRequest request = new HttpRequest();

        String endPoint =
        'https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=' +
      mc.ConsumerKey__c +
      '&client_secret=' +
      mc.ConsumerSecret__c +
      '&username=' +
      mc.username__c +
      '&password=' +
      mc.password__c;
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
      //  request.setBody('{"email":"mighty moose"}');
        
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {

            System.debug('Success');

            map<string,Object> resultMap = (map<string,Object>)JSON.deserializeUntyped(response.getBody());
            accesstoken = (String)resultMap.get('access_token');

        } else {
            //System.debug(response.getBody());
        }
        
        System.debug('Access Token'+accesstoken);
        return accesstoken;
    }


//method call

public static void getResponse(String email) {

    String accesstoken=makeGetCallout();

    System.debug('>>>>>>>>>>>>>>>>'+accesstoken);
    Http http = new Http();
    HttpRequest httpReq = new  HttpRequest();
    
    httpReq.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');
    httpReq.setMethod( 'POST' );
    httpReq.setHeader( 'Content-Type', 'application/json;charset=UTF-8' );
    httpReq.setHeader( 'Accept', 'application/json' );
    httpReq.setHeader( 'Authorization', 'Bearer ' + accesstoken );

    String body ='{"Email":"'+email+'"}';
        
    httpReq.setBody(body);

        HttpResponse response = http.send(httpReq);


        if(response.getStatusCode() == 200) {

            System.debug('Success');

            map<string,Object> results = (map<string,Object>)JSON.deserializeUntyped(response.getBody());

           // map<string,Object> resultMap = (map<string,Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('===>'+results);
          

        } else {
            //System.debug(response.getBody());
        }
}

    
}