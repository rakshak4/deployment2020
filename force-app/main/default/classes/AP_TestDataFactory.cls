/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Mehreen Jhummun 
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   08/11/2022   Mehreen Jhummun   Initial Version
**/
@isTest
public with sharing class AP_TestDataFactory {
    
    public static List <User> createUser(Integer numUser)
    {
        List<User> lstUsers = new List<User>();
        for(Integer i=0; i<numUser; i++)
        {
            User user = new User();
            user.email = 'mehreen@spoonconsulting.com';
            user.ProfileId = UserInfo.getProfileId();
            user.UserName = 'titibi@tibiz.com';  
            user.LastName='Jhummun';          
            user.Alias =  'TST1';
            user.TimeZoneSidKey = 'America/New_York';
            user.EmailEncodingKey = 'ISO-8859-1';
            user.LocaleSidKey = 'en_US';
            user.LanguageLocaleKey = 'en_US';
            lstUsers.add(user);
        }
        return lstUsers;
    }

    public static List <Case> createCase(Integer numCase)
    {
        List<Case> lstCas= new List<Case>();
        for(Integer i=0; i<numCase; i++)
        {
        Case cas= new Case(Status='On hold',Origin='Phone');
        lstCas.add(cas);
        
        }
        return lstCas;
    }


    public static List <Account> createAccount(Integer numAcc)
    {
        List<Account> LstAcc= new List<Account>();
        for(Integer i=0; i<numAcc; i++)
        {
        Account acc = new Account(Name='testingtesting',Region__c='North', 	Phone='999000',BillingStreet= 'Royal Rd',BillingCity = 'Moka',BillingCountry = 'Mauritius');
        LstAcc.add(acc);
        }
        return LstAcc;

    }
}