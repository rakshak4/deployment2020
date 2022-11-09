/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-07-2022   Chevish Boodhun   Initial Version
**/
@isTest
public with sharing class LC01_CaseInvoicesController_TEST {

    @testSetup
    private static void testSetup() {

        List<User> lstUsr = AP_DataFactory.createUsers(1);
        insert lstUsr;

        System.runAs(lstUsr[0]) {
            List<Case> lstCse = AP_DataFactory.createCases(1);
            insert lstCse;

            List<Invoice__c> lstInv = AP_DataFactory.createInvoices(2, lstCse[0].Id);
            insert lstInv;
        }
        
    }

    @isTest
    private static void testGetRelatedInvoices() {

        Case cse = [SELECT Id FROM Case WHERE Subject = 'Test subject'];
        List<Invoice__c> lstInv = LC01_CaseInvoicesController.getRelatedInvoices(cse.Id);

        System.assertEquals(lstInv.size(), 2, 'Incorrect number of Invoices');
        System.assertEquals(lstInv[0].AmountWithoutVat__c, 1, 'First Invoice does not match');
        System.assertEquals(lstInv[1].AmountWithoutVat__c, 0, 'Second Invoice does not match');

    }

}