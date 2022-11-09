/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-08-2022   Bhavish Nundoo   Initial Version
**/
@isTest
public with sharing class AP01_updateAccountTest {
    @testSetup static void testSetup(){
        List<User> lstUsr = AP01_testDataFactory.createUser(5);
        insert lstUsr;
        System.runAs(lstUsr[0]){
            List<Account> lstAcc = AP01_testDataFactory.createAccount(5);
            insert lstAcc;

        }
    }
    @isTest public static void testGetAccount(){
        
            Test.startTest();
            
            AP01_getAllAccount.getAllAcc();
            
            Test.stopTest();

    }
    
 }