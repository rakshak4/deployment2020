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
public with sharing class LC01_DisplayInvoicesControllerTest2 {
    @testSetup
    public static void testSetup()
    {
        
        List<User> lstUsers = AP_TestDataFactory.createUser(1);
        insert(lstUsers);

        System.runAs(lstUsers[0]){

            //call class factory pou case and invoice
            List<Case> lstCas = AP_TestDataFactory.createCase(1);
            insert LstCas;

            List<Invoice__c> lstInv = AP_TestDataFactory.createInvoice(1);
            lstInv[0].Case__c=lstCas[0].Id;
            insert lstInv;

        }
    }







    @isTest public static void componentTest()
    {
        List<User> lstUsers = [SELECT Id, name FROM USER WHERE LastName='Jhummun'];

        //bizin call li encor acoz lahaut p store dan vitual database
       
        List<Case> lstCas= new List<Case>();
        List<Invoice__c> lstInv= new List<Invoice__c>();

        System.runAs(lstUsers[0]) {
            
            Test.startTest();
            lstCas = [SELECT Id FROM Case WHERE Status ='On hold'];
            lstInv = LC01_DisplayInvoicesController.getInvoices(lstCas[0].Id);
            List<Invoice__c> lstInv2 = [
                SELECT Id
                FROM Invoice__c 
                WHERE Case__c =: lstCas[0].Id 
                ORDER BY CreatedDate DESC
              ];
            Test.stopTest();

            System.assertEquals(lstInv,lstInv2,'good');
            // System.assertEquals(1,lstInv2.size(),'good');

        }
    }
    
}