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
public with sharing class LC01_InvoiceControllerTest2 {
    @TestSetup 
    static void testSetup(){
        List<User> lstUser = AP_TestDataFactory.createUser(1);
        INSERT lstUser;

        List<Case> lstCas = AP_TestDataFactory.createCase(1);
        INSERT lstCas;

        List<Invoice__c> lstinv= AP_TestDataFactory.createInvoice(1);
        lstinv[0].Case__c=lstCas[0].Id;
        INSERT lstinv;
    }

    @isTest 
    static void testGetInvoice()
    {
        List<Case> lstCas = [SELECT Id FROM Case];
        List<Invoice__c> lstInv = LC01_DisplayInvoicesController.getInvoices(lstCas[0].Id);
        System.assertEquals(1, lstInv.size(), 'one invoice inserted');
        System.debug('Size of invoice list: ' + lstInv.size());
    }

    @isTest 
    public static void testGetInvoice2() {
        List<Case> lstCase = new List<Case>();
        List<Invoice__c> lstInv = new List<Invoice__c>();

        List<User> lstUsers = [SELECT Id FROM USER WHERE LastName='Testing' ];
        System.runas(lstUsers[0]){
            Test.startTest();
            lstCase = [SELECT Id FROM Case WHERE Status ='Payment'];
            lstInv = LC01_DisplayInvoicesController.getInvoices(lstCase[0].Id);
            //lstInv = LC01_DisplayInvoicesController.getInvoice('test'); // forwrong
            List<Invoice__c> lstInv2 = [
                SELECT
                  Name,
                  AmountWithVat__c,
                  InvoiceDate__c,
                  Account__c,
                  AmountWithoutVat__c,
                  Contact__c
                FROM Invoice__c
                WHERE Case__c = :lstCase[0].Id
                ORDER BY CreatedDate DESC
              ];
             
            Test.stopTest();
            System.assertEquals(lstInv,lstInv2,'good');
            //System.assert( lstInv.size()==0,'wrong'); //for wrong
            //System.assertEquals(1,lstInv2.size(),'good'); // for size
        }
    }
}