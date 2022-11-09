/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
@isTest
public with sharing class LC01_GetRelatedInvoicesTest {
    @TestSetup
    public static void setup(){
        // Create user 
        User user = AP_DataFactory.createUser(1)[0]; 
        user.FirstName='Fname';
        user.LastName='Lname';        
        user.Username = 'Test@CaseStudyDev.com'; 
        insert user;

        // Create cases and invoices as newly created user
        System.runAs(user){
            Account acc = AP_DataFactory.createAccounts(1)[0];
            acc.Name='Test Account';
            insert acc;

            List<Case> lstCas= AP_DataFactory.createCases(2);
            lstCas[0].Subject='Testing';
            lstCas[0].AccountId=acc.Id;
            lstCas[1].Subject='Test no Invoice';
            lstCas[1].AccountId=acc.Id;            
            insert lstCas;


            List<Invoice__c> lstInv= AP_DataFactory.createInvoices(2);
            for(Invoice__c inv: lstInv){
                inv.Case__c=lstCas[0].Id;
            }            
            insert lstInv;
        }       
    }

    @isTest
    public static void testGetRelatedInvoices() {
        List<User> lstUsers= [SELECT Id From User WHERE Username=:'Test@CaseStudyDev.com'];
        User userToTest= lstUsers[0];

        System.runAs(userToTest){
            Test.startTest();        
            //Case with 2 Invoices
            List<Case> lstCas = [SELECT Id FROM Case WHERE Subject =: 'Testing'];
            List<Invoice__c> lstInv = LC01_GetRelatedInvoices.getRelatedInvoices(lstCas[0].Id);  
            
            //Case with no Invoices
            List<Case>  lstCas2= [SELECT Id FROM Case WHERE Subject =: 'Test no Invoice'];
            List<Invoice__c> lstInv2 = LC01_GetRelatedInvoices.getRelatedInvoices(lstCas2[0].Id);

            //Pass invalid Id
            List<Invoice__c> lstInv3=LC01_GetRelatedInvoices.getRelatedInvoices('elo');

            Test.stopTest();
            
            //Check that only two invoices are related to the case
            System.assertEquals(lstInv.size(),2,'There should be only two invoices in the list');
            System.assertNotEquals(lstInv.size(),0,'There should be only two invoices in the list');
            
            //Check that the second case created has no invoices
            System.assert(lstInv2.size()==0,'Expecting no invoices');

            System.assertEquals(lstInv3.size(),0);
        }
    }
}