@RestResource(urlMapping='/WS01_AccountDetails/*')
global without sharing class WS01_AccountDetails {
    
    @HttpPost
    global static Map<String,String> sendAccountInfo (){
    	Map<String,String> resultmap = new map <String,String>();
        
        RestRequest req = RestContext.request;
        system.debug('***req : '+ req);
        Map<String, Object> params =  (Map<String, Object>)JSON.deserializeUntyped(req.requestBody.toString());
        
        String emailStr = params.get('Email') != null ? String.valueOf(params.get('Email')) : null;
        
        if(emailStr == null){
            resultmap = new Map<String,String>{'error' => 'merci de renseigner l\'email' };
        }else {
            list<Account> accLst = [SELECT id, Name, Email__c, Rating, CustomerPriority__c, Mobile__c,Region__c, SLA__c,SLAExpirationDate__c, SLASerialNumber__c, UpsellOpportunity__c, Website FROM Account where Email__c =: emailStr order by createdDate desc];
            
            if(accLst.size()==0){
                resultmap = new Map<String,String>{'error' => 'No Account found.' };
            }
            else{
                resultmap = new Map<String,String>{'Email Address' => accLst[0].Email__c
                    , 'Rating' => accLst[0].Rating
                    , 'CustomerPriority' => accLst[0].CustomerPriority__c
                    , 'Mobile' => accLst[0].Mobile__c
                    , 'Region' => accLst[0].Region__c
                    , 'SLA' => accLst[0].SLA__c
                    , 'SLAExpirationDate' => string.valueof(accLst[0].SLAExpirationDate__c)
                    , 'SLASerialNumber' => accLst[0].SLASerialNumber__c
                    , 'UpsellOpportunity' => accLst[0].UpsellOpportunity__c
                    , 'Website' => accLst[0].Website                    
                };
            }
        }
        System.debug('resultmap: ' + resultmap);
    	return resultmap;
    }

}