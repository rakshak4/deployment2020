/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-08-2022   Ayman Rummun   Initial Version
**/
public with sharing class AP07_displayRecordType_us02ApexBasics {
    
    public static Map<String,List<Account>> getAllAccountWhichHasCaseByRecordType()
    {
        List<Case> lstCas = [SELECT Account.Name, Account.RecordType.DeveloperName FROM Case WHERE  AccountId != NULL AND Account.RecordType.DeveloperName != NULL];

        Set<String> setaccountId = new Set<String>();

        for(Case newcases : lstCas){
            setaccountId.add(newcases.Account.Id);
        }

        List<Account> lstAcc = [SELECT Name,RecordType.DeveloperName From Account WHERE Account.Id IN:setaccountId ];
    
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