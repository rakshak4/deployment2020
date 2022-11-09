/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-08-2022   Bhoovanyu Dhomah   Initial Version
**/
@isTest
public with sharing class AP14_AccWithCas_TEST {
    @TestSetup
    static void init(){

        List<User> lstUsr = AP13_TestFactory.createUsers(1);
        insert lstUsr;

        String RecordIdIndividual=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        String RecordIdBusiness=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();

        List<Account> lstAcc = AP13_TestFactory.createAccounts(5);
        lstAcc[0].RecordTypeId = RecordIdIndividual;
        lstAcc[1].RecordTypeId = RecordIdBusiness;
        lstAcc[2].RecordTypeId = RecordIdBusiness;
        lstAcc[3].RecordTypeId = RecordIdBusiness;
        // lstAcc[2].RecordTypeId = RecordIdBusiness;
        // lstAcc[3].RecordTypeId = RecordIdBusiness;
        insert lstAcc;

        List<Case> lstCas = AP13_TestFactory.createCases(3);
        lstCas[0].AccountId=lstAcc[0].Id;
        lstCas[1].AccountId=lstAcc[1].Id;
        lstCas[2].AccountId=lstAcc[2].Id;
        insert lstCas;

    }

    @isTest static void testAccWithCas(){
        List<User> lstUsr = new List<User>();
        // List<Case> lstCas = new List<Case>();
        // List<String> c = new List<String>();
        // List<String> lstStrBusiness = new List<String>();
        Map<String,List<String>> mapAccAcutal = new Map<String,List<String>>();
        Map<String,List<String>> mapAccExpected = new Map<String,List<String>>();
        String RecordIdIndividual=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        String RecordIdBusiness=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();

        test.startTest();
        lstUsr = [SELECT Id FROM User WHERE UserName='test@bhoov.com'];
        System.runAs(lstUsr[0]){
            mapAccAcutal = AP14_AccWithCas.findAccWithCse();
            // lstStrIndividual = [SELECT Account.Name FROM Case WHERE Account.RecordTypeId =:RecordIdIndividual];
            // lstStrBusiness = [SELECT Account.Name FROM Case WHERE Account.RecordTypeId =:Business];

            // List<Case> lstAcc = [SELECT Account.Name, Account.RecordTypeId FROM Case];

            // Map<String,List<String>> mapAcc = new Map<String,List<String>>();

            // for(Case cse: lstAcc){
            //     // System.debug(cse.Account.Name);
            //     if(mapAccExpected.containsKey(cse.Account.RecordTypeId)){
            //         mapAccExpected.get(cse.Account.RecordTypeId).add(cse.Account.Name);
            //     }
            //     else{
            //         mapAccExpected.put(cse.Account.RecordTypeId, new List<String>{cse.Account.Name});
            //     }


            // }

        }
        System.debug('Actual record individual: '+mapAccAcutal.get(RecordIdIndividual)[0]);
        System.assertEquals(mapAccAcutal.get(RecordIdIndividual)[0],'bhoov1','Account bhoov1 should be in Individual');
        System.debug('Actual record businessc1: '+mapAccAcutal.get(RecordIdBusiness)[0]);
        System.assertEquals(mapAccAcutal.get(RecordIdBusiness)[0],'bhoov2','Account bhoov2 should be in Business');
        System.debug('Actual record business 2: '+mapAccAcutal.get(RecordIdBusiness)[1]);
        System.assertEquals(mapAccAcutal.get(RecordIdBusiness)[1],'bhoov3','Account bhoov3 should be in Business');

        System.assertEquals(1,mapAccAcutal.get(RecordIdIndividual).size());
        System.assertEquals(2,mapAccAcutal.get(RecordIdBusiness).size());

        // System.assertEquals(mapAccAcutal.get(RecordIdIndividual),mapAccExpected.get(RecordIdIndividual),'values for individual record not same');
        // System.assertEquals(mapAccAcutal.get(RecordIdBusiness),mapAccExpected.get(RecordIdBusiness),'values for business record not same');
        

        test.stopTest();
    }
}