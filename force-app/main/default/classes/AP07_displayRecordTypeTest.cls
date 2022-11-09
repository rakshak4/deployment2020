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
@isTest
public with sharing class AP07_displayRecordTypeTest {
    @TestSetup
    static void setup(){

        List<User> user = AP_TestDataFactory.createUser(1);
        INSERT user;

        List<Account> lstAcc = AP_TestDataFactory.createAccount(2);
        lstAcc[0].RecordTypeId= Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();
        lstAcc[1].RecordTypeId = Schema.SobjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        INSERT lstAcc;

        List<Case> lstCas = AP_TestDataFactory.createCase(2);
        lstCas[0].AccountId= lstAcc[0].Id;
        lstCas[1].AccountId= lstAcc[1].Id;
        INSERT lstCas;
  
    }

    @isTest
    static void checkgetAccountWhichHasCaseByRecordType()
    {
        List<User> lstUser = [SELECT Id FROM User ];

        System.runas(lstUser[0])
        {
            Test.startTest();
            // List<Case> lstCas = [SELECT Account.RecordType.DeveloperName FROM Case WHERE  AccountId != NULL AND Account.RecordType.DeveloperName != NULL];

            // Set<String> setaccountId = new Set<String>();

            // for(Case newcases : lstCas){
            //     setaccountId.add(newcases.Account.Id);
            // }
            List<Account> lstAcc = [SELECT Name,RecordType.DeveloperName FROM Account];
    
            Map<String,List<Account>> mapAcc = new Map<String,List<Account>>();
            for(Account newAcc: lstAcc){
                if(mapAcc.containsKey(newAcc.RecordType.DeveloperName)){
                    mapAcc.get(newAcc.RecordType.DeveloperName).add(newAcc);  
                }
                else{
                    mapAcc.put(newAcc.RecordType.DeveloperName,new List<Account>{newAcc});
                }      
            }

            Map<String, List<Account>> mapAcc2 = AP07_displayRecordType_us02ApexBasics.getAllAccountWhichHasCaseByRecordType();

            System.assertEquals(mapAcc, mapAcc2, 'Equal');

        }
    }
}