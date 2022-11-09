/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Narmeen Nehor
**/
public with sharing class AP03_UserStories {
    
     public static void userStory1(){
        List<Case> lstDamagedVehicle = new List<Case>([SELECT DamageType__c, LoanVehicle__c, LoanVehicle__r.Name FROM Case WHERE DamageType__c != NULL ORDER BY DamageType__c]);

        System.debug('List of damaged vehicles ' + lstDamagedVehicle);
        

        if(!lstDamagedVehicle.isEmpty()){
            System.debug(lstDamagedVehicle);
        }
     }

     public static void userStory2(){
        List<Account> lstAcc = new List<Account>([SELECT Name,RecordTypeId FROM Account WHERE Id IN(SELECT AccountId FROM Case)]);

        String recordTypeIndividual = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        String recordTypeBusiness = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();

        Map<String, List<Account>> mapAccount = new Map<String, List<Account>>();

        if(lstAcc.size()>0){
            for(Account acc : lstAcc){
                if(acc.RecordTypeId != NULL){
                    if(!mapAccount.containsKey(acc.RecordTypeId)){
                        mapAccount.put(acc.RecordTypeId, new List<Account>());
                    }
                    
                     mapAccount.get(acc.RecordTypeId).add(acc);
                }
           }

           System.debug('Individual Accounts: ' + mapAccount.get(recordTypeIndividual));
           System.debug('Business Accounts: ' + mapAccount.get(recordTypeBusiness));
        }      

    }
}