/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   08/11/2022   Souhayl Johar   Initial Version
**/

@isTest
public with sharing class AP03_TestPJOTest {
    @TestSetup
    static void setup(){

             Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User user1 = new User(Alias = 'souJo', Email='souhayl.johar@spoonconsulting.com', 
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
        LocaleSidKey='en_US', ProfileId = p.Id, 
        TimeZoneSidKey='America/Los_Angeles', UserName='SouhaylJo@testorg.com');
        insert user1;
        System.runAs(user1){

        List<Account> lstAcc = AP_TestDataFactory.createAccount(1);
        INSERT lstAcc;
        
    }
  }
    @isTest
    public static void testCallout()
    {
        List<User> lstuser = [SELECT Id FROM User];

        System.runas(lstuser[0])
        {
            List<Account> lstAcc = [SELECT Id FROM Account];
        
            //set mock callout class
            //set mock - pe activate sa class, li pou repon nou ban kitchose ki ena dan class la
            Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

            AP03_TestPJO.getAccountInfo(lstAcc[0].Id);
        }

    }
       
}