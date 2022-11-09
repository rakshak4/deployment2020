/**
 * @File Name          : <ClassName>.cls
 * @Description        : Visualisation with VS Code
 * @Author             :  AMO <Spoon Consulting>
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-21-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    DD-MMM-YYYY, HH:MM:SS      <TRIGRAM>      Initial Version
**/


public with sharing class AP02_UpdateVehicle {
   /**
    * USE CASE 1
         * @description Find all Damaged vehicles list by damage type.
         * @author Aaliyah Mohungoo | 19/10/2022
         * @return Damaged vehicles should be listed in order of damage type.
         **/
        public static void damageVehicle(){
            List<Case> lstVeh = [SELECT Vehicle__r.Name, DamageType__c FROM Case WHERE DamageType__c != NULL ORDER BY DamageType__c ];

            System.debug(lstVeh);
            
        }
        /**
         * USE CASE 2
         * @description Find all accounts having a case and display by recordType.
         * @author Aaliyah Mohungoo | 19/10/2022
         * @return Output: One map with two keys, one for each recordType
         **/
        public static void accountCase(){
            // Get all the account having a case
            List<Case> lstcas = [SELECT AccountId FROM Case WHERE AccountId != Null];
            // An account can have multiple case so put into a SET to remove duplicate
            Set<String> setId = new Set<String>();
            // Loop throught the list and insert into the SET
            for (Case cas : lstcas) {                
                setId.add(cas.AccountId);
            }
            // Now create a list to select the name from account where the ID is equal to the id in the SET
            List<Account> lstAcc = [SELECT Name ,RecordType.DeveloperName, RecordTypeId FROM Account WHERE Id IN: setId AND RecordTypeId != NULL];
            System.debug(lstAcc);
            // Create the Map
            Map<String,List<Account>> mapAccount = new Map<String,List<Account>>();
            // Loop throught list and check if the record type already exist 
            for (Account acc : lstAcc) { 
                // If yes add an account to it.
                if(mapAccount.containsKey(acc.RecordType.DeveloperName)){
                    mapAccount.get(acc.RecordType.DeveloperName).add(acc);
                }
                // else create a new account for that record type
                else{
                    mapAccount.put(acc.RecordType.DeveloperName, new List<Account>{acc});
                }   

            }
            if(mapAccount.size() > 0){
                System.debug('Map Account: ' + mapAccount);
            }           
            
        }
         /**
          * USE CASE 3
         * @description Assign all accounts of region “North” having recordType ‘Customer’ 
         * and their related contacts to the manager.
         * @author Aaliyah Mohungoo | 19/10/2022
         * @return The accounts and contacts update must be seen on account and related contact after execute anonymous.
         **/
        public static void useCase3(){
                List<Account> lstacc = [SELECT OwnerId FROM Account WHERE 	Region__c = 'North' AND  RecordType.DeveloperName = 'Individual'];
                List<User> lstUser = [SELECT Id FROM User WHERE Profile.Name = 'Manager'];

                for (Account acc : lstacc) {
                    acc.OwnerId = lstUser[0].Id;                    
                }

                if(lstacc.size()>0)
                {
                    System.debug(lstacc);
                }
                
        }
        /**
         * USE CASE 5
         * @description Delete all accounts and contacts created today
         * @author Aaliyah Mohungoo | 19/10/2022
         * @return All accounts and contacts created today deleted.
         **/
        public static void useCase5(){


        }
        public static void accountWithCase() {
            List<Case> lstCse = [SELECT AccountId FROM Case WHERE AccountId != NULL];
            Set<String> setAccountId = new Set<String>();
        
            for (Case cse : lstCse) {
              setAccountId.add(cse.AccountId);
            }
        
            List<Account> lstAcc4 = [
              SELECT Name, RecordTypeId, RecordType.DeveloperName
              FROM Account
              WHERE Id IN :setAccountId AND RecordTypeId != NULL
            ];
            Map<String, List<Account>> mapAccount = new Map<String, List<Account>>();
            for (Account Acc7 : lstAcc4) {
                System.debug('>>>> acc4: ' + acc7.RecordType.DeveloperName);
                if (mapAccount.containsKey(Acc7.RecordTypeId)) {
                    mapAccount.get(Acc7.RecordTypeId).add(Acc7);
                    System.debug('>>>> acc4: ' + acc7.RecordType.DeveloperName);
                } else {
                  System.debug('>>>> acc4: ' + acc7.RecordType.DeveloperName);
                mapAccount.put(Acc7.RecordTypeId, new List<Account>{ Acc7 });
              }
            }
            System.debug('Map Account: ' + mapAccount);
          }
}