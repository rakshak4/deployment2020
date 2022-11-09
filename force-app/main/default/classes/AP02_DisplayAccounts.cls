/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Ashita Gopaul
**/
public with sharing class AP02_DisplayAccounts {
    public static void useCase2() {
        List<Account> lstAcc = [
          SELECT Name, RecordType.DeveloperName
          FROM Account
          WHERE
            Id IN (SELECT AccountId FROM Case)
            AND RecordType.DeveloperName != NULL
          LIMIT 200
        ];
    
        Map<String, List<Account>> mapAccounts = new Map<String, List<Account>>();
    
        if (lstAcc.size() > 0) {
          for (Account acc : lstAcc) {
            if (!mapAccounts.containsKey(acc.RecordType.DeveloperName)) {
              mapAccounts.put(acc.RecordType.DeveloperName, new List<Account>());
            }
    
            mapAccounts.get(acc.RecordType.DeveloperName).add(acc);
          }
          System.debug(mapAccounts);
        }
      }
}