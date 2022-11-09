/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-08-2022   Bhoovanyu Dhomah   Initial Version
**/
@isTest
public with sharing class AP13_TestFactory {
    
    public static List<Invoice__c> createInvoices(Integer num){

        List<Invoice__c> lstInv = new List<Invoice__c>();
        for(Integer i=0; i<num; i++){
            Invoice__c inv = new Invoice__c();
            inv.AmountWithoutVat__c=555;
            lstInv.add(inv);
        }
        return lstInv;
    }

    public static List<User> createUsers(Integer num){
        List<User> lstUsers = new List<User>();

        for(Integer i=0; i< num; i++){
            User u = new User(Alias = 'TST1', Email='TestUser@spoonconsulting.dev', LastName='Testing Last Name', LanguageLocaleKey='en_US',
            LocaleSidKey='en_US', ProfileId = UserInfo.getProfileId(),
            TimeZoneSidKey='America/New_York',
            UserName='test@bhoov.com' ,EmailEncodingKey='ISO-8859-1');
            lstUsers.add(u);
        }
        return lstUsers;
    }

    public static List<Case> createCases(Integer num){
        List<Case> lstCas = new List<Case>();
        for(Integer i=0; i< num; i++){
            Case cse = new Case();
            cse.Subject='test case '+(i+1);
            cse.Status='Working';
            cse.Origin='Email';
            lstCas.add(cse);
        }
        return lstCas;
    }

    public static List<Account> createAccounts(Integer num){
        List<Account> lstAcc = new List<Account>();
        for(Integer i=0; i<num; i++){
            Account acc = new Account();
            acc.Name = 'bhoov'+(i+1);
            lstAcc.add(acc);
        }
        return lstAcc;
    }

}