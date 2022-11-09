public with sharing class AP03_SyncAccountInfo Implements Database.AllowsCallouts{
    /**************************************************************************************
    -- - Author        : Spoon Consulting
    -- - Description   : AP03_SyncAccountInfo Class - Gets account info from Ti Biz
    --
    -- Maintenance History:
    --
    -- Date         Name  Version  Remarks
    -- -----------  ----  -------  -------------------------------------------------------
    -- 30-OCT-2022  SGO   1.0     Initial Version
    --------------------------------------------------------------------------------------
    **************************************************************************************/
    // Define variables
    static AccountDetails currAccount = new AccountDetails();

    public static String getAccessToken(){
        String accessToken='';
        String instanceURL='';
        
        CalloutCredentials__mdt mdt = [SELECT Endpoint__c, ClientID__c, ClientSecret__c, Username__c, Password__c, Token__c FROM CalloutCredentials__mdt where DeveloperName = 'APIGetToken'];
        // System.debug('*** getAccessToken mdt '+mdt);
        
        try{
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(mdt.Endpoint__c);
            request.setMethod('POST');
            request.setTimeout(120000);
            request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
            request.setBody('grant_type=password' +
                            '&client_id='+mdt.ClientID__c +
                            '&client_secret='+mdt.ClientSecret__c +
                            '&username='+mdt.Username__c + 
                            '&password='+mdt.Password__c+mdt.Token__c);
            // System.debug('*** getAccessToken request '+request);
            HttpResponse response = http.send(request);
            System.debug('*** getAccessToken response '+response);
            if (response.getStatusCode() == 200) {
                Map<String, Object> resultMap = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
                accessToken = (String)resultMap.get('access_token');
                instanceURL = (String)resultMap.get('instance_url');
            }
            else{
                // Error
                String errMsg = response.getStatusCode() + ' : ' + response.getStatus();
                // error in error msg
                System.debug('The following error occurred:'+errMsg);

                currAccount.errMessage = errMsg;
                // Save to record
                saveAccountInfo(currAccount, true);
            }
        }catch(Exception ex){
            System.debug('An exception occurred:'+ex.getMessage());
        }
        
        return accessToken;
    }

    
    // To optimise for bulk 
    @future(callout=true)
    public static void getAccountInfo(Id accountId) {
        Map<String, String> body = new Map<String, String>();
        currAccount.accountId = accountId;
        
        // Get email and construct map 
        List<Account> lstAccount = new List<Account>([SELECT Id, Name, Email__c FROM Account WHERE Id = :accountId]);

        // Construct body
        body.put('Email', lstAccount[0].Email__c);

        // Get access token
        String accessToken = getAccessToken();

        try{
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            // Move endpoint to label
            request.setEndpoint('https://spoonconsultingltd3-dev-ed.develop.my.salesforce.com/services/apexrest/WS01_AccountDetails');
            request.setMethod('POST');
            request.setHeader('Authorization', 'Bearer ' + accessToken);
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            // Set the body as a JSON object
            String jsonBody = JSON.serialize(body);
            System.debug('>> jsonBody '+jsonBody);
            request.setBody(jsonBody);
            // request.setBody('{"Email":"dhovisha.munbodh@spoonconsulting.com"}');
            System.debug('sendAccountInfo request: ' + request);
            HttpResponse response = http.send(request);
            System.debug('sendAccountInfo response: ' + response);

            // Parse the JSON response
            if(response.getStatusCode() != 200) {
                System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
            } else {
                System.debug(response.getBody());
                Map<String, Object> mapResult = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
                System.debug('>> mapResult '+mapResult); 
 
                currAccount.email = (String) mapResult.get('Email Address');
                currAccount.rating = (String) mapResult.get('Rating');
                currAccount.customerPriority = (String) mapResult.get('CustomerPriority');
                currAccount.mobile = (String) mapResult.get('Mobile');
                currAccount.region = (String) mapResult.get('Region');
                currAccount.SLA = (String) mapResult.get('SLA');
                currAccount.SLAExpirationDate = (String) mapResult.get('SLAExpirationDate');
                currAccount.SLASerialNumber = (String) mapResult.get('SLASerialNumber');
                currAccount.upsellOpportunity = (String) mapResult.get('UpsellOpportunity');
                currAccount.website = (String) mapResult.get('Website');
                
                currAccount.dateSynchro = system.now();
                currAccount.errMessage = '';
                
                System.debug('currAccount '+currAccount);

                // Save to record
                saveAccountInfo(currAccount, false);
            }
        }catch(Exception ex){
            System.debug('An exception occurred:'+ex.getMessage());
        }

        // return response;
    }

    public static void saveAccountInfo(AccountDetails currAccount, Boolean error){
        System.debug('>>> saveAccountInfo starts, error:' + error + ', currAccount: '+currAccount);

        // Get current contact admin
        List<Account> lstAccounts = new List<Account>([SELECT Id, Email__c, Rating, CustomerPriority__c, Mobile__c, Region__c, SLA__c, SLAExpirationDate__c, SLASerialNumber__c, UpsellOpportunity__c, Website FROM Account WHERE Id = :currAccount.accountId]);
        System.debug('@@ lstAccounts: '+lstAccounts);

        if (lstAccounts.size() > 0){

            // In case of error, save only error message
            if(error){
                if(currAccount.errMessage != null){
                    // lstAccounts[0].usrAcc_MessageErreur__c = currAccount.errMessage;
                }
            }
            // Else, save all fields
            else{
                if(currAccount.email != null){
                    lstAccounts[0].Email__c = currAccount.email;
                }
                if(currAccount.rating != null){
                    lstAccounts[0].Rating = currAccount.rating;
                }
                if(currAccount.customerPriority != null){
                    lstAccounts[0].CustomerPriority__c = currAccount.customerPriority;
                }
                if(currAccount.mobile != null){
                    lstAccounts[0].Mobile__c = currAccount.mobile;
                }
                if(currAccount.region != null){
                    lstAccounts[0].Region__c = currAccount.region;
                }
                if(currAccount.SLA != null){
                    lstAccounts[0].SLA__c = currAccount.SLA;
                }
                if(currAccount.SLAExpirationDate != null){
                    lstAccounts[0].SLAExpirationDate__c = Date.valueOf(currAccount.SLAExpirationDate);
                }
                if(currAccount.SLASerialNumber != null){
                    lstAccounts[0].SLASerialNumber__c = currAccount.SLASerialNumber;
                }
                if(currAccount.upsellOpportunity != null){
                    lstAccounts[0].UpsellOpportunity__c = currAccount.upsellOpportunity;
                }
                if(currAccount.website != null){
                    lstAccounts[0].Website = currAccount.website;
                }
                // if(currAccount.dateSynchro != null){
                //     lstAccounts[0].usrAcc_DateDeSynchronisation__c = currAccount.dateSynchro;
                // }
                // Reset error message
                // lstAccounts[0].usrAcc_MessageErreur__c = currAccount.errMessage;
            }
            

            try{
                update lstAccounts[0];
            }
            catch(Exception ex){
                System.debug('@@ ex while updating account '+ex);
                // Account currAccount = new Account(Id = lstAccounts[0].Id, messageErreur__c = ex.getMessage());
                // System.debug('@@ currAccount '+currAccount);
                // update currAccount;
            }
        }

        System.debug('>>> saveAccountInfo ends, lstAccounts: '+lstAccounts);
    }


    // Wrapper class
    public class AccountDetails {
        public String accountId;
        public String email;
        public String rating;
        public String customerPriority;
        public String mobile;
        public String region;
        public String SLA;
        public String SLAExpirationDate;
        public String SLASerialNumber;
        public String upsellOpportunity;
        public String website;
        // Error 
        public String errMessage;
        public Datetime dateSynchro;
    }
    
}