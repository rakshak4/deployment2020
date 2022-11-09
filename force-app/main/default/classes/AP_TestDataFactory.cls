/**
 * @description       : 
 * @author            : Keny Poisson
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-08-2022   Keny Poisson   Initial Version
**/
@isTest
public with sharing class AP_TestDataFactory {

    public static List<Account> createAccount(Integer numOfAccounts){

        List<Account> lstAcc = new List<Account>();
        for(Integer i=0; i<numOfAccounts; i++){
            Account acc = new Account();
            acc.Name='Yanki'+i;
            acc.Region__c='North';
            acc.phone='58806712'+i;
            lstAcc.add(acc);
        }

        return lstAcc;
    }
    

    public static List <Case> createCase(Integer NumOfCaseToCreate){

        List <Case> lstCas=new List<Case>();

        for (Integer i=0;i<NumOfCaseToCreate;i++){
            
            Case cas=new Case();
            cas.Origin='Email';
            cas.Status='Working';
            cas.Subject='Testing case from test class';
            lstCas.add(cas);
        }

        return lstCas;

    }

    public static List<invoice__c> createInvoice(Integer NumOfInvoice, List <Case> lstCas){

        
        List <invoice__c> lstInv=new List<invoice__c>();
        
        if(NumOfInvoice == lstCas.size()){

        for (Integer i=0;i<NumofInvoice;i++){
            invoice__c inv=new invoice__c();
            inv.Case__c=lstCas[i].id;
            inv.AmountWithoutVat__c=150.00+i;
            lstInv.add(inv);
       
        }
    }

    else {
        System.debug('lstcas size does not match lstinv ERR in AP_TestDataFactory');
    } 
    
    return lstInv;

    }

    public static List<User> createUser(Integer numOfUser){
        List <User> lstUser=new List<User>();

        for (Integer i=0;i<numOfUser;i++){
        User user = new User();
        user.LastName='muahhhh'+i;
        user.CommunityNickname='muahh29'+i;
        //user.UserRoleId='South Agent';
        user.email = 'TestUser2@spoon'+i+'consulting.dev';
        user.ProfileId = UserInfo.getProfileId();
        user.UserName = 'duss@'+i+'test.com';            
        user.Alias =  'duss'+i;
        user.TimeZoneSidKey = 'America/New_York';
        user.EmailEncodingKey = 'ISO-8859-1';
        user.LocaleSidKey = 'en_US';
        user.LanguageLocaleKey = 'en_US';

        lstUser.add(user);

        }

        return lstUser;
    }
}