/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   07/11/2022   Souhayl Johar   Initial Version
**/
@isTest
public with sharing class LC03_InvoiceRelatedToCaseTest {
    @testSetup static void InitData() {
        
       Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User user1 = new User(Alias = 'souJo', Email='souhayl.johar@spoonconsulting.com', 
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
        LocaleSidKey='en_US', ProfileId = p.Id, 
        TimeZoneSidKey='America/Los_Angeles', UserName='SouhaylJo@testorg.com');
        insert user1;

        System.runAs(user1){
        
        
        List<Case> lstCse = AP_TestDataFactory.createNewCase(5);
        // Case cse1 = new Case();
        // lstCse.add(cse1);
        insert lstCse;

        List<Invoice__c> lstInv = AP_TestDataFactory.createNewInvoice(5);

        if (lstCse.size() == lstInv.size()){
            for (Integer i = 0; i < lstInv.size(); i++){
                lstInv[i].Case__c = lstCse[i].Id;
            }
        }
        else if (lstCse.size() != lstInv.size()){
            for (Integer i = 0; i < lstInv.size(); i++){
                lstInv[i].Case__c = lstCse[0].Id;
            }
        }
        else{
            System.debug('No case found');
        }

        insert lstInv;    

        System.debug('Case Id In Invoice :'+lstInv.size());
        }
    }

// method to get userDetails

// method to get case details



         @isTest 
         public static void testGetInvoices() {
                List<Case> lstCase = new List<Case>();
                List<Invoice__c> lstInv = new List<Invoice__c>();
        
                List<User> lstUsers = [SELECT Id, name FROM USER WHERE LastName='Testing' ];
                System.runas(lstUsers[0]){
                    
                    Test.startTest();

                    lstCase = [SELECT Id FROM Case WHERE Status ='Working'];
                    System.debug(lstCase);
                    lstInv  = LC03_InvoiceRelatedToCase.getInvoices(lstCase[0].Id);

                    // List<Invoice__c> lstInv2 = [
                    //     SELECT
                    //       Name,
                    //       AmountWithVat__c,
                    //       InvoiceDate__c,
                    //       Account__c,
                    //       AmountWithoutVat__c,
                    //       Contact__c
                    //     FROM Invoice__c
                    //     WHERE Case__c = :lstCase[0].Id
                    //     ORDER BY CreatedDate DESC
                    //   ];
                    Test.stopTest();
                    System.assertEquals(1,lstInv.size(),'good');
                }         
            }
        }