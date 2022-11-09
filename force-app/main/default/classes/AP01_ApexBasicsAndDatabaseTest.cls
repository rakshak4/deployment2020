/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Jason Ramjaya
**/

//Not 100% coverage due to lstCon issue
@isTest
public with sharing class AP01_ApexBasicsAndDatabaseTest {
    @testSetup public static void testSetup() {
        
        List<User> lstUser = AP_TestDataFactory.createUsers(1);
        insert lstUser;
        System.debug('User:'+lstUser[0].Id);

        System.runAs(lstUser[0]) {
            List<Account> testAcList =  AP_TestDataFactory.createAccounts(2);
            String individualID = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName()
                .get('Individual')
                .getRecordTypeId();
            String businessID = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName()
                .get('Business')
                .getRecordTypeId();
            testAcList[0].RecordTypeId = individualID;
            testAcList[1].RecordTypeId = businessID;
            insert testAcList;
            System.debug('Acc:'+testAcList[0].Id);
            System.debug('Acc1 type:'+testAcList[0].RecordTypeId);
            System.debug('Acc2 type:'+testAcList[1].RecordTypeId);

            List<Case> testCaseList =  AP_TestDataFactory.createCases(2);
            testCaseList[0].AccountId = testAcList[0].Id;
            testCaseList[1].AccountId = testAcList[1].Id;
            insert testCaseList;
            System.debug(testCaseList[0].Id);
        }
    }

    @isTest public static void testUseCase2() {
        List<User> lstUsers = [SELECT Id, name FROM USER WHERE LastName LIKE 'Testing%' LIMIT 1];

        System.runas(lstUsers[0]) {
            Test.startTest();
            AP02_ApexBasicsAndDatabase.useCase1();
            AP02_ApexBasicsAndDatabase.useCase2();
            AP02_ApexBasicsAndDatabase.insertListAccount();

            List<Account> lstAccAutoGen = [
                SELECT OwnerId, (SELECT OwnerId FROM Contacts)
                FROM Account
                WHERE Name LIKE 'AutoGenAccount%'
            ];

            System.assertEquals(10, lstAccAutoGen.size(), 'Should have 10 accounts');

            AP02_ApexBasicsAndDatabase.useCase3();

            List<User> lstUser = [SELECT Id FROM USER WHERE Profile.Name = 'Manager'];
            System.debug(lstUser);

            List<Account> lstAcc = [
                SELECT OwnerId, (SELECT OwnerId FROM Contacts)
                FROM Account
                WHERE Region__c = 'North' AND RecordType.DeveloperName = 'Individual'
            ];

            List<Contact> lstCon = [
                SELECT OwnerId
                FROM Contact
                WHERE
                    Account.Region__c = 'North'
                    AND Account.RecordType.DeveloperName = 'Individual'
            ];

            System.debug('List of contacts: ' + lstCon);

            if (lstAcc.size() > 0 && lstUser.size() > 0) {
                for (Account acc : lstAcc) {
                    System.assertEquals(lstUser[0].Id, acc.OwnerId, 'Id should be of Manager');
                }
            }
            
            if (lstCon.size() > 0 && lstUser.size() > 0) {
                for (Contact con : lstCon) {
                    System.assertEquals(lstUser[0].Id, con.OwnerId, 'Id should be of Manager');
                }
            }

            

            List<Case> lstCasToDelete = [
                SELECT Id
                FROM Case
                WHERE CreatedDate = TODAY
            ];

            delete lstCasToDelete;

            AP02_ApexBasicsAndDatabase.useCase5();


            List<Account> lstAccToDelete = [
                SELECT Id, Name
                FROM Account
                WHERE CreatedDate = TODAY
            ];

            System.assertEquals(0, lstAccToDelete.size(), 'No record should be retrieved');

            List<Contact> lstConToDelete = [
                SELECT Id, Name
                FROM Contact
                WHERE CreatedDate = TODAY
            ];

            System.assertEquals(0, lstConToDelete.size(), 'No record should be retrieved');
            Test.stopTest();
        }
    }
}