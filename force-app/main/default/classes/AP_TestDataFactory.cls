/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-08-2022   Ayman Rummun   Initial Version
**/
@isTest
public with sharing class AP_TestDataFactory {
    
    public static List<User> createUser(Integer numUser)
    {
        List<User> lstUse= new List<User>();
        for(integer i=0; i<numUser; i++)
        {
            User userObj = new User ();
            userObj.email = 'aymanrummun@gmail.com';
            userObj.ProfileId = UserInfo.getProfileId(); 
            userObj.UserName = i+1 +'bas@hotmail.com';            
            userObj.Alias =  'TST1';
            userObj.TimeZoneSidKey = 'America/New_York';
            userObj.EmailEncodingKey = 'ISO-8859-1';
            userObj.LocaleSidKey = 'en_US';
            userObj.LanguageLocaleKey = 'en_US';
            userObj.LastName = 'Testing';

            lstUse.add(userObj);
        }
        return lstUse;
    }

    public static List<Account> createAccount(Integer numAcc)
    {
        List<Account> lstAcc = new List<Account>();
        for(integer i=0; i<numAcc; i++)
        {
            Account accObj = new Account();
            accObj.Name='test 2';
            accObj.Phone='8888';
            accObj.Region__c='North';

            lstAcc.add(accObj);
        }
        return lstAcc;
    }

    public static List<Case> createCase(Integer numCase)
    {
        List<Case> lstCas = new List<Case>();

        for(integer i=0; i<numCase; i++)
        {
            Case casObj = new case();
            casObj.Status = 'Payment';
            casObj.Origin='Email';

            lstCas.add(casObj);
        }
        return lstCas;
    }

    public static List<Contact> createContact(Integer numCon)
    {
        List<Contact> lstCon = new List<Contact>();

        for(integer i=0; i<numCon; i++)
        {
            Contact conObj = new Contact();

            conObj.LastName='contact Test' + i+1; 
            conObj.Email__c ='test@gmail.com';

            lstCon.add(conObj);
        }
        return lstCon;
    }

    public static List<Invoice__c> createInvoice(Integer numInv)
    {
        List<Invoice__c> lstinv = new List<Invoice__c>();

        for(integer i=0; i<numInv; i++)
        {
            Invoice__c invObj = new Invoice__c();

            invObj.AmountWithoutVat__c = 1000;
            lstinv.add(invObj);
        }
        return lstinv;

    }
}