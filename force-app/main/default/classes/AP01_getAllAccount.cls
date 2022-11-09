/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-08-2022   Bhavish Nundoo   Initial Version
**/
public with sharing class AP01_getAllAccount {
    public static void getAllAcc(){
            
        List<Case> lstcse =[SELECT AccountId FROM Case WHERE AccountId!= null ];
       

        Set <Id> setAccId = new Set<Id>();
        Map<String,List<Account>> mapAcc = new Map<String,List<Account>>();
        
        for(Case cse: lstcse){
            setAccId.add(cse.AccountId);
        }
        
        System.debug('>>>'+ setAccId);
        List<Account> lstAcc =[SELECT Name, RecordType.DeveloperName FROM Account WHERE 
        Id =:setAccId AND RecordType.DeveloperName!= Null];

        for (Account acc : lstAcc) {
            if (mapAcc.containsKey(acc.RecordType.DeveloperName)) {

                mapAcc.get(acc.RecordType.DeveloperName).add(acc);
                System.debug('accounts>>>:'+acc);
            }else{

                mapAcc.put(acc.RecordType.DeveloperName, new List<Account>{acc} );
                System.debug('other:>>>'+acc);
            }
        }
        System.debug('Accounts having cases : '+ mapAcc);

    }
}