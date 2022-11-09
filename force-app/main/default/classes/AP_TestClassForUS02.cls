/**
 * @description       : Test class for US_APEX_02
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-08-2022   Asma Ghanty   Initial Version
**/
@isTest
public with sharing class AP_TestClassForUS02 {

    @TestSetup 
    static void testSetup(){
        
        System.debug('-----TEST SETUP-------');

        User asma = AP_TestDataFactory.createUser(1)[0];
        INSERT asma;

        System.debug('User id : ' + asma.Id);

        System.runas(asma){

            List<Account> lstAcc = AP_TestDataFactory.createAccount(3);
            lstAcc[0].RecordTypeId=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();

            INSERT lstAcc;

            System.debug('List of acc '+ lstAcc[1]);

            List<Case> lstCas = AP_TestDataFactory.createCase(3);

            for (Integer i = 0; i < lstAcc.size(); i++){
                lstCas[i].AccountId = lstAcc[0].Id;
            }

            INSERT lstCas;
        }

    }

    @isTest
    static void testUserStory(){

        List<User> lstUser = [SELECT Id FROM User];

        System.runas(lstUser[0]){

            Map<String, List<Account>> mapAcctsRecordType = AP05_userStory1.acctsRecordType();
            System.debug('Map--->'+mapAcctsRecordType);
            System.debug('Map size--->'+mapAcctsRecordType.size());

            System.assertEquals(2, mapAcctsRecordType.size(), 'Not good');
        }
    }

}