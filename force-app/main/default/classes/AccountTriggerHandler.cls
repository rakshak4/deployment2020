/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
public with sharing class AccountTriggerHandler {
   
   public void handleAfterInsert(List<Account> lstNew){
        List<Id> lstId= new List<Id>();
        System.debug(lstNew);
        for(Account acc: lstNew){
            if(acc.Email__c!=null){               
                lstId.add(acc.Id);
            }
        }
        if(lstId.size()>0){   
            //AP07_GetTiBizData.getTiBizData(lstId);
        }   
   }
}