/**
 * @File Name          : AP01_UpdateAccount.cls
 * @Description        : Initialization wiht VS Code
 * @Author             : 
 * @Group              : 
 * @Last Modified By   : Kanigan Somadoo
 * @Last Modified On   : 11-08-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    DD-MMM-YYYY, HH:MM:SS      <TRIGRAM>      Initial Version
**/

public with sharing class AP01_UpdateAccount {

    /**
     * @description Output a name
     * @author Kanigan Somadoo | 19/10/22
     * @return void
    **/

    public static void outputName(){
        System.debug('Kanigan');
    }

       /**
     * @description Method to identify the managed object.
     * @author Kanigan Somadoo | 19/10/22
     * @return Output a name
    **/

    public static void insertAccount(){
        //create an instant of account
        Account acct = new Account();
        acct.Name = 'Toto Polo';
        acct.BillingCity = 'Moka';
        acct.BillingStreet = 'Royal Rd';
        acct.BillingCountry = 'Mauritius';
        acct.Phone = '985632145';
        acct.Region__c = 'East';

        insert acct;
    }

    public static void updateAccount() {

        Account acct = new Account();
        acct.Id = '0017S00000GX839QAD';
        acct.Phone = '12345678';

        update acct;
        

    }

    public static void deleteAccount(){
        Account acct = new Account();
        acct.Id = '0017S00000GX839QAD';


        delete acct;
    }

    public static void retrieveNorthAccount(){
        List<Account> northAccount = [SELECT Name  FROM Account WHERE  Region__c='North' ];

        for(Account acct : northAccount){
            System.debug(acct.Name);
        }

    }

    public static void insertMultipleAccount(){

        List<Account> lstAccount = new List<Account>();
        String recordTypedId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        
        // Creating and adding the accounts to list
        for(Integer i = 0 ; i < 10 ; i++) {

            Account acc = new Account();

            acc.RecordTypeId = recordTypedId;
            acc.Name = 'New Account' + i;
            acc.Phone = '1234567' + i;
            acc.Region__c = 'North';
            acc.BillingCity = 'City' + i;

            lstAccount.add(acc);

        }

        if(lstAccount.size() > 0){
            insert lstAccount;
        }

        // Creating list of contacts for each account

        List<Contact> lstContact = new List<Contact>();

        for(Integer i = 0 ; i < lstAccount.size() ; i++) {

            Contact con = new Contact();
            con.AccountId = lstAccount[i].Id;
            con.LastName = lstAccount[i].Name;
            con.Phone = lstAccount[i].Phone;
            con.MailingCity = lstAccount[i].BillingCity;

            lstContact.add(con);

        }


        if(lstContact.size() > 0) {
            insert lstContact;
        }

        


    }

    //APEX Basics : US02

    public static Map<String, List<Account>> accountWithCase(){
        List<Case> lstCase = [SELECT AccountId FROM Case WHERE AccountId!=null];
        Set<String> setAccount = new Set<String>();

        for(Case cse:lstCase ){
            setAccount.add(cse.AccountId);
        }

        Map<String, List<Account>> mapAccount = new Map<String,List<Account>>();

        List<Account> lstAccount = [SELECT Name, RecordTypeId FROM Account WHERE Id IN :setAccount ];

        for(Account acc : lstAccount){
            if(mapAccount.containsKey(acc.RecordTypeId)){
                mapAccount.get(acc.RecordTypeId).add(acc);
            }else {
                mapAccount.put(acc.RecordTypeId,new List<Account>{acc});
            }
        }

        return mapAccount;
    }

}