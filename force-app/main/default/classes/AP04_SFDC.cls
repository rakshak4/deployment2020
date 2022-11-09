/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-21-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AP04_SFDC {

    //public static final String rTypeIdIndividual= Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
    //public static final String rTypeIdBusiness= Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();
   
   
    public static void accountsHavingCase(){
        //Title : Find all accounts having a case and display by recordType.
       //Acceptance Criterias: 
      //Output: One map with two keys, one for each recordType


        List <Case> lstCase= [SELECT AccountId FROM Case WHERE AccountId != null];
        
        Set<String> setAccId= new Set<String>();
        
        //put account id in a set 
        for (case cs: lstCase){

            setAccId.add(cs.AccountId);

        }

         //query in ACC
         List <Account> lstAccount= [SELECT Id FROM Account WHERE Id IN:setAccId];

         //can do this instead of making a for loop to set id in set
        //Set<Id> setAccIdNew = new Map<Id, Account>(lstAccount).keySet();

        //Do Map for storing id and list of accounts
        Map <String,List<Account>> mapAccount= new Map <String,List<Account>>();

        for (Account acc: lstAccount){
            if(mapAccount.containsKey(acc.RecordTypeId)){
                mapAccount.get(acc.Id).add(acc);
            }
            else {
                mapAccount.put(acc.Id, new List<Account>{acc});
            }
        }


    
    }
}