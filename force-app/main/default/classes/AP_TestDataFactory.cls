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
public class AP_TestDataFactory {

    public static List<User> createUsers(Integer numUsers){
        List<User> lstUser = new List<User>();
        for(Integer i = 0 ; i < numUsers; i++){
            User usr = new User();
            usr.FirstName='Kanigan'; 
            usr.LastName='Somadoo';
            usr.email = 'TestUser@spoonconsulting.dev';
            usr.ProfileId = UserInfo.getProfileId();
            usr.UserName = 'TestKSO@test.com'+i;        
            usr.Alias =  'TST1';
            usr.TimeZoneSidKey = 'America/New_York';
            usr.EmailEncodingKey = 'ISO-8859-1';
            usr.LocaleSidKey = 'en_US';
            usr.LanguageLocaleKey = 'en_US';

        lstUser.add(usr);
        }
        return lstUser;
    }


    public static List<Account> createAccounts(Integer numAccounts){
        List<Account> lstAccount = new List<Account>();
        for(Integer i = 0; i < numAccounts; i++){
            Account acc = new Account();
            acc.Name = 'Account' + i;
            acc.Phone = '5905830' + i;
            acc.Region__c = 'South';

            lstAccount.add(acc);
            
        }
        return lstAccount;
    }

    public static List<Case> createCases(Integer numCases){
        List<Case> lstCase = new List<Case>();
        for(Integer i = 0; i < numCases; i++){
            Case cas = new Case();
            cas.Status = 'New';
            cas.Subject = 'Case Subject ..' + i;
            cas.RegionCase__c = 'North';

            lstCase.add(cas);
        }
        return lstCase;
    }

    public static List<Invoice__c> createInvoices(Integer numInvoices){
        List<Invoice__c> lstInvoice = new List<Invoice__c>();
        for(Integer i = 0 ; i < numInvoices ; i++){
            Invoice__c inv = new Invoice__c();
            inv.Name = 'Inv0'+i;

            lstInvoice.add(inv);
        }
        return lstInvoice;
    }

}