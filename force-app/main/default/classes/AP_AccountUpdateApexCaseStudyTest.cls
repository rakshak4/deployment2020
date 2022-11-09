/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   08/11/2022   Mehreen Jhummun   Initial Version
**/
@isTest
public with sharing class AP_AccountUpdateApexCaseStudyTest {
    @testSetup
    public static void testSetup()
    {
        List<User> lstUsers = AP_TestDataFactory.createUser(1);
        insert(lstUsers);

        System.runAs(lstUsers[0]){

            //call class factory pou case and Account

            List<Account> lstAcc = AP_TestDataFactory.createAccount(2);
            lstAcc[0].RecordTypeId=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();
            lstAcc[1].RecordTypeId=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
            insert lstAcc;

            List<Case> lstCas = AP_TestDataFactory.createCase(2);
            lstCas[0].AccountId=lstAcc[0].Id;
            lstCas[1].AccountId=lstAcc[1].Id;
            insert LstCas;

        }
    }


    @isTest public static void componentTest()
    {
        List<User> lstUsers = [SELECT Id, name FROM USER WHERE LastName='Jhummun'];
        List<Account> lstAcc= new List<Account>();
        Map<String,List<Account>> mapAcc2 = new Map<String,List<Account>>();
        
       
        System.runAs(lstUsers[0]) {
            
            Test.startTest();
            mapAcc2=AP02_AccountUpdateApexCaseStudy.accountCase();
            lstAcc = [SELECT Name,RecordType.DeveloperName From Account];
            Map<String,List<Account>> mapAcc = new Map<String,List<Account>>();
               for(Account newAcc: lstAcc){
                    if(mapAcc.containsKey(newAcc.RecordType.DeveloperName)){
                        mapAcc.get(newAcc.RecordType.DeveloperName).add(newAcc);  
                    }
                    else{
                        mapAcc.put(newAcc.RecordType.DeveloperName,new List<Account>{newAcc});
                    }
               }
            Test.stopTest();

            System.assertEquals(mapAcc2,mapAcc,'good');
            // System.assertEquals(1,lstInv2.size(),'good');

        }
    }
    
}