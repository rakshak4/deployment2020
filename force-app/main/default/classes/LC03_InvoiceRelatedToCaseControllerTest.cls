/**
 * @description       : 
 * @author            : narmeen Nehor
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   07/11/2022   narmeen Nehor   Initial Version
**/
@isTest
public with sharing class LC03_InvoiceRelatedToCaseControllerTest {
    @testSetup public static void testSetup() {

        // List <User> lstUsers = new List <User>();
        // User narmeen = new User();
        
        // narmeen.email = 'TestUser@spoonconsulting.dev';
        // narmeen.ProfileId = UserInfo.getProfileId();
        // narmeen.UserName = 'Test@nehor.com';            
        // narmeen.Alias =  'TST1';
        // narmeen.TimeZoneSidKey = 'America/New_York';
        // narmeen.EmailEncodingKey = 'ISO-8859-1';
        // narmeen.LocaleSidKey = 'en_US';
        // narmeen.LanguageLocaleKey = 'en_US';
        // narmeen.LastName = 'Nehor';
        User narmeen = AP_TestDataFactory.createUsers(1)[0];

        Insert narmeen;
        //System.debug(narmeen.Id);

        System.runAs(narmeen) {
            // The following code runs as user 'narmeen'
            // List<Case> lstCas = new List<Case>();
            // Case cas = new Case(status='New', Origin='Phone');
            // lstCas.add(cas);
            List<Case> lstCas = AP_TestDataFactory.createCases(3);

            insert lstCas;
            //System.debug(lstCas);

            // List<Invoice__c> lstInv = new List<Invoice__c>();
            // Invoice__c inv = new Invoice__c(case__c = lstCas[0].Id);
            // lstInv.add(inv);

            List<Invoice__c> lstInv = AP_TestDataFactory.createInvoices(3);

            if (lstCas.size() == lstInv.size()){
                for (Integer i = 0; i < lstInv.size(); i++){
                    lstInv[i].Case__c = lstCas[i].Id;
                }
            }
            else if (lstCas.size() != lstInv.size()){
                for (Integer i = 0; i < lstInv.size(); i++){
                    lstInv[i].Case__c = lstCas[0].Id;
                }
            }
            else{
                System.debug('No case found');
            }

            insert lstInv;    

            System.debug('Case Id In Invoice :'+lstInv.size());

            // insert lstInv;
            //System.debug(lstInv);
       }

    }

// method to get userDetails
// public static getUserDetails(){
//     List<User> lstUser
//     return User;
// }

// method to get case details
// public static getCaseDetails(caseIdToSearch){

// }
    @isTest 
    public static void testGetInvoices(){
        LC03_InvoiceRelatedToCaseController testClass = new LC03_InvoiceRelatedToCaseController();

        
        List<Case> lstCas = [Select Id From Case];
        List<User> lstUser = [SELECT Id FROM User WHERE LastName = 'xxx'];

        String caseId = lstCas[0].Id;
        
        // System.debug(lstInvTest);

        System.runas(lstUser[0]){
            Test.startTest();
                List<Invoice__c> lstInvTest = LC03_InvoiceRelatedToCaseController.getInvoices(caseId);
                System.assertEquals(1, lstInvTest.size(), 'Not working' );
            Test.stopTest();
        }

        // step 1 : identify params
        // step 2 identify logic
        // step 3 identify return type(if any) -> non voided method]
        
        // 1. get user details
        // 2. run as user
        // 3. get case details  lstCase = callmethod()
        // 4. call method to test(lstCase[0].id)
        // 5. assert returned value
    }

}