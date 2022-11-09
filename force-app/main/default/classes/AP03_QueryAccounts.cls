/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AP03_QueryAccounts {
   
public static void queryAllAccounts(){

    List <Account> listAcc= new List <Account>();
    Map <String,String> mapRegionToAccount = new Map <String,String>();
    listAcc=[SELECT Name,Region__c FROM Account WHERE Region__c !=''];
    
    for(Account Acc: listAcc){

        mapRegionToAccount.put(Acc.Region__c,Acc.Name);

    }

    System.debug('Different Region:' +mapRegionToAccount);
    System.debug('Different Account:' +mapRegionToAccount.Values());


   

      
        
}  
  
    
}