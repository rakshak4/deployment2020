/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 10-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
/**
 * @File Name          : AP02_ParameterExercise.cls
 * @Description        : Initialisation with VSCode
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-20-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0       20/10/22                    AGH       Initial Version
 **/
public with sharing class AP03_mapRegionAcct {
      /**
        * @description Method that query all accts where Region != Null. Build a map of Region and lst of Accts
        * @author Asma Ghanty | 20/10/22
        * @return Map.
        **/

        public static void queryAcct(){
            List<Account> lstAccts = new List<Account>([SELECT Id, Name, Region__c FROM Account WHERE Region__c != Null]);

            Map<string, List<Account>> mapRegionAccts = new Map<String, List<Account>>();
            for (Account acct: lstAccts){

                    if (mapRegionAccts.containsKey(acct.Region__c))
                        {
                            //adding into the list
                        mapRegionAccts.get(acct.Region__c).add(acct);
                        } 
                        else
                        {
                            mapRegionAccts.put(acct.Region__c, new List<Account>{acct});
                        }
                        
           
            }
            System.debug('List of Accounts:' + mapRegionAccts);
        }
    }
                    
            /** 
            Map<String, Account> mapRegionAccts = new Map<String, Account>();
            for (Account acct: [SELECT Id, Name, Region__c FROM Account WHERE Region__c != Null]){
                mapRegionAccts.put(acct.Region__c, acct);
              
            }

            if(mapRegionAccts.size()>0){
                System.debug('List of Accounts:' +mapRegionAccts);
            }
            **/