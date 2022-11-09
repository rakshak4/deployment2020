/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
public with sharing class AP07_GetTiBizData {
    @future(callout=true)
    public static void getTiBizData(List<Id> lstId) {
        List<Account> lstAcc= [SELECT CustomerPriority__c,Website,UpsellOpportunity__c,Rating,
        SLASerialNumber__c,SLAExpirationDate__c,SLA__c,Region__c,Mobile__c,Email__c FROM Account WHERE Id IN :lstId];

        TiBizSetting__mdt credentials = TiBizSetting__mdt.getInstance('TiBizAccessToken');
        Http http = new Http();
        HttpRequest accessTokenRequest = new HttpRequest();
        String accessToken;
        String endpoint ='https://login.salesforce.com/services/oauth2/token?grant_type=password';
        endpoint+='&client_id='+credentials.ConsumerKey__c;
        endpoint+='&client_secret='+credentials.ConsumerSecret__c;
        endpoint+='&username='+credentials.Username__c;
        endpoint+='&password='+credentials.Password__c;
        accessTokenRequest.setEndpoint(endpoint);
        accessTokenRequest.setMethod('POST');
        accessTokenRequest.setTimeout(20000);
        accessTokenRequest.setHeader('Content-type', 'application/json;charset=UTF-8');
        HttpResponse response = http.send(accessTokenRequest);
        if(response.getStatusCode()==200){
            System.debug(response);
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // System.debug(results.get('access_token'));
            accessToken=(String) results.get('access_token');
        }
        else{
            System.debug(response.getStatusCode()+' '+response.getStatus());
        }

        // HttpRequest dataRequest = new HttpRequest();
        // dataRequest.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails/');
        // dataRequest.setMethod('POST');
        // dataRequest.setHeader('Content-type', 'application/json;charset=UTF-8');
        // dataRequest.setHeader('Authorization', 'Bearer ' + accessToken);
        // dataRequest.setBody('{"Email":"test2@spoon.com"}');
        
        // response=http.send(dataRequest);
        // if(response.getStatusCode()==200){
        //     System.debug(response);
        //     Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        //     System.debug(results);
        // }
        // else{
        //     System.debug(response.getStatusCode()+' '+response.getStatus());
        // }
        HttpRequest dataRequest = new HttpRequest();
        dataRequest.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails/');
        dataRequest.setMethod('POST');
        dataRequest.setHeader('Content-type', 'application/json;charset=UTF-8');
        dataRequest.setHeader('Authorization', 'Bearer ' + accessToken);
        
        for(Account acc : lstAcc){            
            dataRequest.setBody('{"Email":"'+acc.Email__c+'"}');            
            response=http.send(dataRequest);
            if(response.getStatusCode()==200){
                System.debug(response);
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                System.debug(results);
                acc.CustomerPriority__c=(String)results.get('CustomerPriority');
                acc.Website=(String)results.get('Website');
                acc.UpsellOpportunity__c=(String)results.get('UpsellOpportunity');
                acc.SLASerialNumber__c=(String)results.get('SLASerialNumber');                
                acc.SLAExpirationDate__c=Date.valueOf((String)results.get('SLAExpirationDate'));
                acc.SLA__c=(String)results.get('SLA');
                acc.Region__c=(String)results.get('Region');
                acc.Mobile__c=(String)results.get('Mobile');
                acc.Rating=(String)results.get('Rating');                                
            }
            else{
                System.debug(response.getStatusCode()+' '+response.getStatus());
            }
        }
        update lstAcc;
    }
}