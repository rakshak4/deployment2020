/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-08-2022   Chevish Boodhun   Initial Version
**/
@isTest
public with sharing class AP_DataFactory {
    
    public static List<User> createUsers(Integer numOfUsers) {

        List<User> lstUsr = new List<User>();
        while (numOfUsers-- > 0) {
            lstUsr.add(new User(
                LastName = 'Chavis',
                email = 'TestUser@spoonconsulting.dev',
                ProfileId = UserInfo.getProfileId(),
                UserName = 'Test' + numOfUsers + '@chavis.mu',           
                Alias =  'TST1',
                TimeZoneSidKey = 'America/New_York',
                EmailEncodingKey = 'ISO-8859-1',
                LocaleSidKey = 'en_US',
                LanguageLocaleKey = 'en_US'
            ));
        }
        return lstUsr;

    }

    public static List<Case> createCases(Integer numOfCases) {

        List<Case> lstCse = new List<Case>();
        while (numOfCases-- > 0) {
            lstCse.add(new Case(
                Subject = 'Test subject',
                Status = 'Working',
                Origin = 'Phone'
            ));
        }
        return lstCse;

    }
    
    public static List<Invoice__c> createInvoices(Integer numOfInvoices, Id caseId) {

        List<Invoice__c> lstInv = new List<Invoice__c>();
        while (numOfInvoices-- > 0) {
            lstInv.add(new Invoice__c(
                Case__c = caseId,
                AmountWithoutVat__c = numOfInvoices
            ));
        }
        return lstInv;

    }

    public static List<Account> createAccounts(Integer numOfAccounts) {

        List<Account> lstAcc = new List<Account>();
        while (numOfAccounts-- > 0) {
            lstAcc.add(new Account(
                Name = 'TestAcc ' + numOfAccounts,
                BillingStreet = 'Street',
                Phone = numOfAccounts + '',
                Region__c = 'North'
            ));
        }
        return lstAcc;

    }

}