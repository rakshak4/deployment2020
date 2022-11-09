/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-07-2022   Kanigan Somadoo   Initial Version
**/
@isTest
public class LC01_RetrieveInvoicesRelatedToCaseTest {

    //use 'constructor' to initialize test data
    @testSetup static void testSetup(){

        //REMEMBER TO ASSOCIATE ACCOUNTID TO CASE BEFORE INSERTING
        // AND CASEID TO INVOICES

        List<User> testUser = AP_TestDataFactory.createUsers(1);
        insert testUser;

        System.debug('>>>>>>>> User Id :' + testUser[0].Id);

        System.runAs(testUser[0]){

            //Create  an Account
            List<Account> acc = AP_TestDataFactory.createAccounts(1);
            insert acc;

            //Create a Case
            List<Case> cas = AP_TestDataFactory.createCases(1);
            cas[0].AccountId = acc[0].Id;
            insert cas;

            //Create Invoices
            List<Invoice__c> inv = AP_TestDataFactory.createInvoices(1);
            inv[0].Case__c = cas[0].Id;
            insert inv;

        }
    
    } 
    
     @isTest public static void testRetrieveInvoicesRelatedToCase() {

        List<User> lstUsr = [SELECT Id, Name FROM User WHERE email = 'TestUser@spoonconsulting.dev'];
        User user = lstUsr[0];

        System.debug('>>>>>>> user Name from select statement'+user.Name);

        List<Invoice__c> lstInv = new List<Invoice__c>();

        System.runAs(user){
            List<Case> lstCas = [SELECT Id FROM Case LIMIT 1];
            System.debug('Case Id retrieved from select statement : >>>'+lstCas[0].Id);

            lstInv = LC01_RetrieveInvoicesRelatedToCase.getInvoices(lstCas[0].Id);
            
        }

        Assert.areEqual(lstInv[0].Name, 'Inv00');
        Assert.areEqual(lstInv.size(), 1);



     }
}