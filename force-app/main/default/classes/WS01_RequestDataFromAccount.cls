/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   08/11/2022   Mehreen Jhummun   Initial Version
**/
public with sharing class WS01_RequestDataFromAccount {
    
    public static String makeGetCallout(){


        String accesstoken;

        CM_Account__mdt mc = CM_Account__mdt.getInstance('APIGetToken');

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id='+mc.ConsumerKey__c+'&client_secret='+mc.ConsumerSecret__c+'&username='+mc.username__c+'&password='+mc.password__c);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
      //  request.setBody('{"email":"mighty moose"}');
        
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() == 200) {

            System.debug('Success');

            map<string,Object> resultMap = (map<string,Object>)JSON.deserializeUntyped(response.getBody());
            accesstoken = (String)resultMap.get('access_token');

        } else {
            //System.debug(response.getBody());
        }
        System.debug('===>'+accesstoken);
        
        return accesstoken;
    }

    public static void CalloutApex(String email){

        String accesstoken = makeGetCallout();

        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint( 'https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails' );
        request.setMethod( 'POST' );
        request.setHeader( 'Content-Type', 'application/json' );
        request.setHeader( 'Accept', 'application/json' );
        request.setHeader( 'Authorization', 'Bearer ' + accesstoken );

        String body ='{"Email":"'+email+'"}';

        request.setBody(body);

        HttpResponse response = http.send(request);


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