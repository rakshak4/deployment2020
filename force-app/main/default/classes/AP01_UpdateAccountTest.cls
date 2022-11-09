/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-08-2022   Kanigan Somadoo   Initial Version
**/
@isTest
public class AP01_UpdateAccountTest {

    @TestSetup
    static void makeData(){
        //Create a User to create Other objects as the user
        List<User> testUser = AP_TestDataFactory.createUsers(1);
        insert testUser;
    
        //RecordTypeId for Individual and business
        String IndividualRecordTypeId =Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        String BusinessRecordTypeId =Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();

        System.debug('>>>>>>>>>IndividualRecordTypeId : ' + IndividualRecordTypeId);
        System.debug('>>>>>>>>>BusinessRecordTypeId : ' + BusinessRecordTypeId);
        
        System.runAs(testUser[0]){


            //Create 2 list of accounts with different the 2 recordTypeId
            List<Account> lstAccIndividual = AP_TestDataFactory.createAccounts(3);
            for(Account acc: lstAccIndividual){
                acc.RecordTypeId = IndividualRecordTypeId;

            }
            System.debug('>>>>>>>>>>>List of Newly created Individual Accounts : ' + lstAccIndividual);
            insert lstAccIndividual;

            List<Account> lstAccBusiness = AP_TestDataFactory.createAccounts(3);
            for(Account acc: lstAccBusiness){
                acc.RecordTypeId = BusinessRecordTypeId;
            }
            System.debug('>>>>>>>>>>>List of Newly created Business Accounts : ' + lstAccBusiness);
            insert lstAccBusiness;


            //Create Cases and associate with the different Account with different recordTypeId
            List<Case> lstCas = AP_TestDataFactory.createCases(6);
            System.debug('>>>>>>>>>>>List of 6 Cases creates : ' + lstCas);

            List<Account> lstAccount = [SELECT Id FROM Account];
            System.debug('>>>>>>>>>>> List of Account Id: ' + lstAccount);


            //Assign each account created a case
            for(Integer i = 0 ; i < lstCas.size() ; i++){
                lstCas[i].AccountId = lstAccount[i].id;
            }
            insert lstCas;
            

        }
       
        
    }

    @isTest
    public static void TestAccountWithCase(){


        Test.startTest();
        Map<String, List<Account>> mapAccount =  AP01_UpdateAccount.accountWithCase();

        System.debug('>>>>>>>>>>>Map Returned Value' + mapAccount);

        //Testing number of keys in Map
        System.assertEquals(2, mapAccount.size());
        //Testing for Individual record type
        System.assertEquals(3, mapAccount.get('0127S000000btZ7QAI').size());
        //Testing for Business record type
        System.assertEquals(3, mapAccount.get('0127S000000btZ2QAI').size());
        //Test if account with certain record id has been inserted in the proper key set
        System.AssertEquals('0127S000000btZ2QAI', mapAccount.get('0127S000000btZ2QAI')[0].RecordTypeId);
        System.AssertEquals('0127S000000btZ7QAI', mapAccount.get('0127S000000btZ7QAI')[0].RecordTypeId);
        Test.stopTest();



    }


}