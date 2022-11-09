/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-07-2022   Kanigan Somadoo   Initial Version
**/
public with sharing class WS01_updateCreatedAccUponExistingEmail {

    public static void getEmailRelatedInfo(String accEmail){

        // First Callout : POST request with credentials defined in metadata type
        AccountSettingWS01__mdt aPIGetToken = AccountSettingWS01__mdt.getInstance('APIGetToken');
        String clientId = aPIGetToken.client_id__c;
        String clientSecret = aPIGetToken.client_secret__c;
        String username = aPIGetToken.username__c;
        String pwd = aPIGetToken.password__c;


        String getAccessTokenEndpoint = 'https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id='
        +clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+pwd;

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(getAccessTokenEndpoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response = http.send(request);
        
        System.debug(response.getBody());

        Map<String, Object> credentials = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());

        String tokenType = (String)credentials.get('token_type');
        String accessToken = (String)credentials.get('access_token');
        //Second request to fetch details relating to email
        System.debug('>>>>>>>>> token'+tokenType);


        if(credentials.isEmpty()){
            System.debug('Access Token NOT Granted!');
        }
        else{
            //Build second request
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');
            req.setMethod('POST');
            req.setBody('{"Email": "'+accEmail+'"}');
            req.setHeader('Content-Type', 'application/json');
            req.setHeader('Authorization',  tokenType+' '+accessToken);

            HttpResponse res = http.send(req);
            System.debug('>>>>>> Sending second request');

            if(res.getStatusCode() != 200){
                System.debug('>>>>>>> Second Request failed !');
            }
            else{

                Map<String, Object> mapEmailRelInfo  = (Map<String,Object>)JSON.deserializeUntyped(res.getBody());
    
                System.debug(mapEmailRelInfo);
                System.debug('>>>>>Customer Priority : ' + mapEmailRelInfo.get('CustomerPriority'));

            }

        }
        
    }

    
}