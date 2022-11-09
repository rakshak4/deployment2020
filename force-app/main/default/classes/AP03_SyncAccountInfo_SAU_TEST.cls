@isTest 
public with sharing class AP03_SyncAccountInfo_SAU_TEST {

    @TestSetup
    static void initData(){
        //List <Account> lstAccs = AP_TestDataFactory.createAccs[0];

        List<User> lstUsers = new List<User>();
        User userObj = new User();
        userObj.FirstName = 'Thai';
        userObj.LastName  = 'Chung';
        userObj.email = 'ThaiChung@RS.com';
        userObj.Phone = '51234567';

        lstUsers.add(userObj);
        AP_TestDataFactory.generateUsers(lstUsers);

        Account acc = AP_TestDataFactory.createAcc();
        insert acc;


        //insert lstAccs;
        
    }

    @isTest static void TestGetAccountInfo(){
        List<Account> lstAccs = [SELECT Id, Name FROM Account];

        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new SyncAccountMock());  
            AP03_SyncAccountInfo.getAccountInfo(lstAccs[0].Id);
        Test.stopTest();
    }
    
}