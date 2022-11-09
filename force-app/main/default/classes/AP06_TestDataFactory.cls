/**
 * @description       :
 * @author            : Sambhav Bholah
 * @group             :
 * @last modified on  : 11-08-2022
 * @last modified by  : Sambhav Bholah
 **/
@isTest
public with sharing class AP06_TestDataFactory {

    public static List<User> createUser() {
        List<User> lstUsers = new List<User>();
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
        User u = new User(
            Alias = 'standt',
            Email = 'standarduser@testorg.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Testing',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = uniqueUserName
        );
        lstUsers.add(u);
        insert lstUsers;

        return lstUsers;
    }

    public static String getAccountRecordTypeId(String recordTypeName){
        String recordTypeID = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get(recordTypeName).getRecordTypeId();
        return recordTypeID;
    }

    public static List<Account> createAccount(String recordTypeIdRetrieved){
        List<Account> lstAccount= new List<Account>();

        for (Integer i = 0; i < 10; i++) {
            Account acc = new Account();
            acc.Name = 'Test '+i;
            acc.RecordTypeId = recordTypeIdRetrieved;
            acc.Phone = '232323';
            acc.Region__c = 'North';
            lstAccount.add(acc);    
        }
        return lstAccount;
    }
    
    public static List<Case> createCaseRelatedToAccount(List<Account> lstAccount) {
        List<Case> lstCase = new List<Case>();

        for (Integer i = 0; i < 10; i++) {
            Case cse = new Case(Subject = 'Test related' + i, Status = 'Payment');
            cse.Account__c = lstAccount[i].Id;
            lstCase.add(cse);    
        }
        return lstCase;
    }


    public static List<Case> createCase() {
        List<Case> lstCase = new List<Case>();

        for (Integer i = 0; i < 10; i++) {
            Case cse = new Case(Subject = 'Test', Status = 'Payment');
            lstCase.add(cse);    
        }
        return lstCase;
    }

    public static List<Invoice__c> createInvoice(List<Case> lstCase){
        List<Invoice__c> lstInvoice = new List<Invoice__c>();

        for (Integer i = 0; i < 10; i++) {
            Invoice__c inv = new Invoice__c(Case__c = lstCase[0].Id);
            inv.name = 'test';
            lstInvoice.add(inv);
        }
        
        return lstInvoice;
    }
}