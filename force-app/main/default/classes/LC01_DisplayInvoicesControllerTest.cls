/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Jason Ramjaya
**/
@isTest
public with sharing class LC01_DisplayInvoicesControllerTest {

    @testSetup public static void testSetup() {

        List<User> lstUser = AP_TestDataFactory.createUsers(1);
        insert lstUser;
        System.debug('User:'+lstUser[0].Id);

        System.runAs(lstUser[0]) {
            List<Account> testAcList =  AP_TestDataFactory.createAccounts(1);
            insert testAcList;
            System.debug('Acc:'+testAcList[0].Id);

            List<Case> testCaseList =  AP_TestDataFactory.createCases(1);
            for(Case cas:testCaseList) {
                cas.AccountId = testAcList[0].Id;
            }
            insert testCaseList;
            System.debug(testCaseList[0].Id);

            List<Invoices__c> testInvList = AP_TestDataFactory.createInvoices(1);
            for(Invoices__c inv: testInvList) {
                inv.Account__c = testAcList[0].Id;
                inv.CaseAssignedTo__c = testCaseList[0].Id;
            }
            insert testInvList;
            System.debug(testInvList[0].Id);
        }
    }

    @isTest public static void testInvoiceList() {



        List<Invoices__c> lstInvoices = new List<Invoices__c>();
        List<Case> lstCases = new List<Case>();
        List<User> lstUsers = [SELECT Id, name FROM USER WHERE LastName LIKE 'Testing%' LIMIT 1];
        

        System.runas(lstUsers[0]) {
            Test.startTest();

            lstCases = [SELECT Id FROM Case WHERE Status = 'New'];
            System.debug(lstCases);

            lstInvoices = LC01_DisplayInvoicesController.getInvoices(lstCases[0].Id);
            List<Invoices__c> lstInvoices2 = [
            SELECT Name, InvoiceDate__c, Account__c, AmountWithVat__c, Contact__c,
            AmountWithoutVat__c 
            FROM Invoices__c 
            WHERE CaseAssignedTo__c =: lstCases[0].Id
            ORDER BY CreatedDate DESC];
            //List<Invoices__c> lstInvoices3 = LC01_DisplayInvoicesController.getInvoices('124');
            Test.stopTest();

            System.debug(lstInvoices);

            //System.assertEquals(null, lstInvoices3, 'Hmm, what is happening?');
            System.assertEquals(lstInvoices2, lstInvoices, 'Identical list expected');
            System.assertEquals(1, lstInvoices.size(), 'Only one invoice expected');

        }
  
    }
}