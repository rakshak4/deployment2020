/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-06-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-06-2022   Bhoovanyu Dhomah   Initial Version
**/
@RestResource(urlMapping='/Account/*')
global with sharing class WS_01GetAccREST {

    @HttpGet
    global static String GetAccOnEmail() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String email = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);

          List<Account> lstAcc = [SELECT Email__c, Rating, CustomerPriority__c, Mobile__c, Region__c, SLA__c, SLAExpirationDate__c, SLASerialNumber__c, Website FROM Account WHERE Email__c=:email ORDER BY CreatedDate DESC];
          Map<String,Object> mapAcc = new Map<String,Object>{'Account'=>lstAcc[0]};

          If(lstAcc.size()>0){
            System.debug(lstAcc[0]);
            return Json.serializePretty(mapAcc);	
            // return lstAcc[0];
            // return mapAcc;
          }
          return null;
        //   else{
        //     return 'No account found';
        //   }
    }
}