/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   11-08-2022   Bhavish Nundoo   Initial Version
**/
@isTest
public with sharing class AP01_testDataFactory {
    public static List<User> createUser(Integer numUser){
        List<User> lstUsr = new List<User>();
        for(Integer i=0; i<numUser; i++){
            User user = new User();
            user.email = 'TestUser@spoonconsulting.dev';
            user.ProfileId = UserInfo.getProfileId();
            user.UserName = 'xrex@test.com'+i;
            user.LastName=  'xrex@test.com'+i;         
            user.Alias =  'TST1'+i;
            user.TimeZoneSidKey = 'America/New_York';
            user.EmailEncodingKey = 'ISO-8859-1';
            user.LocaleSidKey = 'en_US';
            user.LanguageLocaleKey = 'en_US';
            lstUsr.add(user);
        }
        return lstUsr;
        
    }
    public static List<Account> createAccount(Integer numAcc){
        List<Account> lstAcc = new List<Account>();
        for(Integer i=0; i<numAcc; i++){
            Account acc = new Account();
            acc.Name='Ashita'+i;
            acc.Region__c='North';
            acc.BillingStreet='dhsfdh';
            lstAcc.add(acc);
        }
        return lstAcc;

    }
    public static List<Case> createCase(Integer numCas,List <Account> lstAcc){
        List<Case> lstCas = new List<Case>();
        if(lstAcc.size()==numCas){
            for(Integer i=0; i<numCas; i++){
                Case cas= new Case();
                cas.AccountId = lstAcc[i].Id;
                cas.Status='Working';
                cas.Origin='Phone';
                lstCas.add(cas);
    
            }

        }else{
            for(Integer i=0; i<lstAcc.size(); i++){
                Case cas= new Case();
                cas.AccountId = lstAcc[i].Id;
                cas.Status='Working';
                cas.Origin='Phone';
                lstCas.add(cas);
    
            }

        }
        
        return lstCas;


    }
    public static List<Invoice__c> createInvoice(Integer numInv,List<Case> lstCas){
        List<Invoice__c> lstInv = new List<Invoice__c>();
        if (lstCas.size()==numInv) {
            
        for(Integer i=0; i<numInv; i++){
            Invoice__c inv = new Invoice__c();
            inv.Case__c= lstCas[i].Id;
            inv.AmountWithoutVat__c=150;
            lstInv.add(inv);
        }
            
        }else{
            for(Integer i=0; i<lstCas.size(); i++){
                Invoice__c inv = new Invoice__c();
                inv.Case__c= lstCas[i].Id;
                inv.AmountWithoutVat__c=150;
                lstInv.add(inv);
            }

        }
        
        return lstInv;
    
    }
}