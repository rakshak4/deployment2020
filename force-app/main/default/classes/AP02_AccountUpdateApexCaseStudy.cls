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
public with sharing class AP02_AccountUpdateApexCaseStudy {
    public static Map<String,List<Account>> accountCase()
    {
        List<Case> lstCas = [SELECT Account.Name, Account.RecordType.Name FROM Case WHERE AccountId != NULL];

        Set<String> setaccountId = new Set<String>();

        for(Case newcases : lstCas){
            setaccountId.add(newcases.Account.Id);

        }

        List<Account> lstAcc = [SELECT Name,RecordType.DeveloperName From Account WHERE Account.Id IN:setaccountId];
    
        Map<String,List<Account>> mapAccount = new Map<String,List<Account>>();

           for(Account newAcc: lstAcc){
                if(mapAccount.containsKey(newAcc.RecordType.DeveloperName)){
                    mapAccount.get(newAcc.RecordType.DeveloperName).add(newAcc);  
                }

                else{
                    mapAccount.put(newAcc.RecordType.DeveloperName,new List<Account>{newAcc});

                }
               
           }
           if(mapAccount.size()>0){

                   System.debug(mapAccount);

           }

           return mapAccount;
    }
}