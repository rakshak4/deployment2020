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
public class AP10_TestPJOTest {

    @TestSetup
    static void makeData(){
     
        List<User> testUser = AP_TestDataFactory.createUsers(1);
        System.runAs(testUser[0]){
        //create an account to pass in the id to the method getAccountInfo
        List<Account> lstAcc = AP_TestDataFactory.createAccounts(1);
        insert lstAcc;
        }

    }
    public static void TestGetAccountInfo() {

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

        List<Account> lstAcc = [SELECT Id FROM Account];

        Test.startTest();
        AP10_TestPJO.getAccountInfo(lstAcc[0].Id);
        Test.stopTest();

    }
}