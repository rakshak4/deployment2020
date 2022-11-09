/**************************************************************************************

-- - Author        : Spoon Consulting

-- - Description   : AccountTriggerHandler - Evaluation of rules before dispersion in service classes.

--

-- Maintenance History:

--

-- Date         Name  Version  Remarks

-- -----------  ----  -------  -------------------------------------------------------

-- 03-NOV-2022  HMO   1.0     Initial Version

--------------------------------------------------------------------------------------

**************************************************************************************/

public class AccountTriggerHandler {

    public static Id recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();

    public void handleAfterInsert(List<Account> lstNewAccs){

        List<Account> lstAccs = new List<Account>();

        

        for (Account acc : lstNewAccs){

            if (String.isNotBlank(acc.Email__c) && (acc.recordTypeId == recordTypeId)){

                lstAccs.add(acc);

            }

        }

        

        if (!lstAccs.isEmpty()){
    		// To optimise for bulk 
            AP03_SyncAccountInfo.getAccountInfo(lstAccs[0].Id);

        }

    }

    

     public void handleAfterUpdate(List<Account> lstNewAccs, Map<Id, Account> mapOldAccs){

         List<Account> lstAccs = new List<Account>();

         

         for (Account acc : lstNewAccs){

             if (String.isNotBlank(acc.Email__c) && (acc.recordTypeId == recordTypeId) && acc.Email__c != mapOldAccs.get(acc.Id).Email__c){

                lstAccs.add(acc);

             }

         }

         if (!lstAccs.isEmpty()){
    		// To optimise for bulk 
            AP03_SyncAccountInfo.getAccountInfo(lstAccs[0].Id);

        }

    }

}