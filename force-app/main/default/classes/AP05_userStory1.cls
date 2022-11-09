/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 11-08-2022
 * @last modified by  : Asma Ghanty
 **/
/**
 * @File Name          : AP01_updateAccount.cls
 * @Description        : Initialisation with VSCode
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : Asma Ghanty
 * @Last Modified On   : 11-08-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0       20/10/22                    AGH       Initial Version
 **/
public with sharing class AP05_userStory1 {
    /**
   * @description Method to Find all Damaged vehicles list by damage type.
   * @author Asma Ghanty | 20/10/22
   * @return String List of damaged vehicles.
   * US01
   **/
    public static void getDamageVehicles(){
        List<Case> lstDamageVeh = new List<Case>([SELECT Vehicle__c, Damage_type__c FROM Case WHERE Damage_type__c!=NULL ORDER BY Damage_type__c]);
        
        System.debug('List of damaged vehicles:' +lstDamageVeh);
    }

    /**
   * @description Method to Find all accounts having a case and display by recordType.
   * @author Asma Ghanty | 20/10/22
   * @return One map with two keys, one for each recordType.
   * US02
   **/
    public static Map<String, List<Account>> acctsRecordType(){
       
    //finding all accounts with a case 
    List<Account> lstAccts = new List<Account>([SELECT Name, RecordType.DeveloperName  FROM Account WHERE RecordType.DeveloperName!=Null]);
    List<Case> lstCases = new List<Case>([SELECT AccountId FROM Case WHERE AccountId!=Null]);

    Map<String, List<Account>> mapAcctsRecordType = new Map<String, List<Account>>();

    for(Case cse: lstCases){
        //set
        Set<String>setAcctId = new Set<String>();
        setAcctId.add(cse.AccountId);

    }

        for(Account acct: lstAccts){
        if (mapAcctsRecordType.containsKey(acct.RecordType.DeveloperName))
        {
            mapAcctsRecordType.get(acct.RecordType.DeveloperName).add(acct);
            //mapAcctsRecordType.get(cse.AccountId).add(cse);
        }
    
        else{
            mapAcctsRecordType.put(acct.RecordType.DeveloperName, new List<Account>{acct});
            //mapAcctsRecordType.put(cse.AccountId, new List<Case>{cse});

        }
    }
    System.debug('Accounts with case:' +mapAcctsRecordType);

    return mapAcctsRecordType;
}

/**
   * @description Method to Assign all accounts of region “North” having recordType 'Individual' and their related contacts to the manager.
   * @author Asma Ghanty | 21/10/22
   * @return 
   * US03
   **/

//    public static void assignIndividualNorth(){

//    }
}