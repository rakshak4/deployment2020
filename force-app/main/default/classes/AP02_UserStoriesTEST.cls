/**
 * @description       : 
 * @author            : Sambhav Bholah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Sambhav Bholah
**/
@isTest 
public with sharing class AP02_UserStoriesTEST {
    @TestSetup
    static void testSetup() {
        //create Users
        //create Account
        //create Case related to above account

        List<User> lstUsers = AP06_TestDataFactory.createUser();

        System.runAs(lstUsers[0]) {
            // The following code runs as user 'u'
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId());
            String recordTypeIdRetrieved = AP06_TestDataFactory.getAccountRecordTypeId('Business');
            List<Account> lstAccount = AP06_TestDataFactory.createAccount(recordTypeIdRetrieved);
            insert lstAccount; 
            List<Case> lstCase = AP06_TestDataFactory.createCaseRelatedToAccount(lstAccount);
            insert lstCase;
 
        }
    }

    @isTest
    public static void testAP02_UserStories(){
        system.debug('------------------TESTING STARTS------------------');
        List<User> lstUsers = new List<User>();
        List<Account> lstAccount= new List<Account>();
        List<Case> lstCase = new List<Case>();

        lstAccount = [SELECT Id, Name,RecordTypeId   FROM Account];
        system.debug('this is record type ID'  +lstAccount[5].RecordTypeId );
        //lstCase = [SELECT Id FROM Case WHERE Account__c =: lstAccount[0].Id];
        //system.debug(lstCase);

        lstUsers = [SELECT Id FROM User WHERE LastName = 'Testing'];
        
        System.runAs(lstUsers[0]) {
            //AP02_UserStories.US_APEX02();
            Test.startTest();
            Map<String, List<Account> > testMap = AP02_UserStories.US_APEX02();

            //System.debug(testMap);
            Test.stopTest();
            //System.assertEquals(10, lstInvoice.Size(), 'size is good');   
        }
        system.debug('------------------TESTING ENDS------------------');
    }
}