/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-07-2022   Bhavish Nundoo   Initial Version
**/

public with sharing class WS01_AccountRequestREST {
    public static String makeCalloutAccount() {
        CMAccountTiVitesse__mdt cmAcc = CMAccountTiVitesse__mdt.getInstance('APIGetToken');
        //System.debug(lstAcc.ClientId__c);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id='+cmAcc.ClientId__c+ '&client_secret='+cmAcc.ClientSecret__c+'&username='+cmAcc.ClientUsername__c+'&password='+cmAcc.ClientPassword__c);
        request.setMethod('POST');
        System.debug(cmAcc.ClientUsername__c);
        HttpResponse response = http.send(request);
        String accessToken;
        if(response.getStatusCode() == 200) {
            
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
           accessToken=(String) results.get('access_token');
           System.debug('>>>'+(String)results.get('access_token'));
            
        }
        return (String) accessToken;
    }

    public static String getResponse(){
        String email= 'test2@spoon.com';



        String accessToken=makeCalloutAccount();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(email);
        


        System.debug('access token >>>>: '+accessToken);
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {
            Map<String, Object> resultMap = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
              string  accessToken1 = (String)resultMap.get('access_token');
              string  instanceURL = (String)resultMap.get('instance_url');
             String res = response.getBody();
             System.debug(res);

        }
        return '';
    }
}