/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   08/11/2022   Narmeen Nehor   Initial Version
**/
@isTest
public with sharing class AP_TestDataFactory {
public static List<User> createUsers(Integer numOfUsers){
        List <User> lstUsers = new List <User>();
        
        for(Integer i = 0; i < numOfUsers; i++){
            User usr1 = new User();

            usr1.email = 'TestUser1234@spoonconsulting.dev';
            usr1.ProfileId = UserInfo.getProfileId();
            usr1.UserName = 'Test1234@xxx.com';            
            usr1.Alias =  'TST1';
            usr1.TimeZoneSidKey = 'America/New_York';
            usr1.EmailEncodingKey = 'ISO-8859-1';
            usr1.LocaleSidKey = 'en_US';
            usr1.LanguageLocaleKey = 'en_US';
            usr1.LastName = 'xxx';

            lstUsers.add(usr1);
        }

        return lstUsers;
}

    public static List<Case> createCases(Integer numCase){
        List<Case> lstCas = new List<Case>();

        for(Integer i = 0; i < numCase; i++){
            Case casObj = new Case();

            casObj.status = 'New';
            casObj.Origin = 'Phone';

            lstCas.add(casObj);
        }

        return lstCas;
    }

    public static List<Invoice__c> createInvoices(Integer numInv){
        List<Invoice__c> lstInv = new List<Invoice__c>();

        for(Integer i = 0; i < numInv; i++){
            Invoice__c inv = new Invoice__c();

            inv.Vat__c = 25;
            inv.AmountWithoutVat__c = 150;

            lstInv.add(inv);

        }

        return lstInv;
    }

    public static List<Account> createAccountIndividual(Integer numOfAccount){

        List<Account> lstAcc = new List<Account>();

        for (Integer i = 0; i < numOfAccount; i++){
            Account acc = new Account();

            acc.Name = 'salma';
            acc.RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
            acc.Region__c = 'West';
            acc.Phone = '7654';
            // acc.BillingAddress = 'asdfg';
            acc.BillingCity = 'tyui';
            acc.BillingCountry = 'cvbn';

            lstAcc.add(acc);
        }

        return lstAcc;

    }

}