/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-07-2022   Bhoovanyu Dhomah   Initial Version
**/

@isTest
public with sharing class LC01_InvoicesController_TEST {
    // public LC01_InvoicesController_TEST() {

    // }

    // Profile p = [SELECT Id FROM Profile WHERE Name='Agent'];
    

    @TestSetup static void init(){
        //String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
        
        // User u = new User(Alias = 'TST1', Email='TestUser@spoonconsulting.dev', LastName='Testing Last Name', LanguageLocaleKey='en_US',
        // LocaleSidKey='en_US', ProfileId = UserInfo.getProfileId(),
        // TimeZoneSidKey='America/New_York',
        // UserName='test@bhoov.com' ,EmailEncodingKey='ISO-8859-1');
        // insert u;

        List<User> lstUsr = AP13_TestFactory.createUsers(1);
        insert lstUsr;
        System.runAs(lstUsr[0]) {
            // The following code runs as user 'u'
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId());
            
            // Case cse = new Case();
            // cse.Subject='test case 1';
            // cse.Status='Working';
            // cse.Origin='Email';
            // insert cse;

            List<Case> lstCas = AP13_TestFactory.createCases(1);
            insert lstCas;

            // List<Invoice__c> lstInv = new List<Invoice__c>{
            //     new Invoice__c(
            //     Case__c=cse.Id,
            //     AmountWithoutVat__c=555
            //     ),new Invoice__c(
            //         Case__c=cse.Id,
            //         AmountWithoutVat__c=666
            //     )

            // };
            // insert lstInv;

            List<Invoice__c> lstInv = AP13_TestFactory.createInvoices(2);
            for(Integer i=0; i<lstInv.size(); i++){
                lstInv[i].Case__c=lstCas[0].Id;
                // lstInv[i].AmountWithoutVat__c=+ i;
            }
            insert lstInv;
        }
        

    }
    @isTest static void testRelatedInvoice(){
        System.debug('here');
        List<Case> lstCse = new List<Case>();
        List<Invoice__c> lstInv = new List<Invoice__c>();
        List<User> usr = new List<User>();
        test.startTest();
            usr = [SELECT Id FROM User WHERE UserName='test@bhoov.com'];
                System.runAs(usr[0]){
                    lstCse =[SELECT Id FROM Case WHERE Subject='test case 1'];
                    System.debug('List returned 1 '+lstCse);
                    lstInv = LC01_InvoicesController.getInvoices(lstCse[0].Id);
                    System.debug('List returned 2 '+lstInv);
                }
            
        test.stopTest();
        
        System.assertEquals(lstInv[0].AmountWithoutVat__c,555,'Amount should be 555');
        System.assertEquals(lstInv[1].AmountWithoutVat__c,555,'Amount should be 666');


    }
    @isTest static void testRelatedInvoiceNeg(){

        List<Invoice__c> lstInv2 = LC01_InvoicesController.getInvoices('abcd');
        System.assertEquals(lstInv2.size(), 0);

        //assert exception
        
        try{
            List<Invoice__c> lstInv3 = LC01_InvoicesController.getInvoices(null);
        } catch (DmlException ex) {
            System.debug('exception');
            System.assertEquals('An exception occured:', ex.getMessage());
        }  

        
        // try{
        //     List<Invoice__c> lstInv2 = LC01_InvoicesController.getInvoices('abcd');
        // }



    }
}