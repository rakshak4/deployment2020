/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   08/11/2022   Souhayl Johar   Initial Version
**/
@isTest
public with sharing class AP_TestDataFactory {

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
   
    public static List<Case> createNewCase(Integer numCase) {

        List<Case> lstCse = new List<Case>();
        for(Integer i = 0; i < numCase; i++){
            Case caseObj = new Case();
            caseObj.Status      ='Working';
            caseObj.Origin      ='Phone';
            caseObj.Type       ='Electronic';

            lstCse.add(caseObj);

        }
        return lstCse;
    }

    public static List <Invoice__c> createNewInvoice(Integer numInv) {

        List<Invoice__c> lstInv = new List<Invoice__c>();
        for(Integer i = 0; i < numInv; i++){
            invoice__c invObj = new invoice__c();
            invObj.AmountwithoutVat__c = 999999;
            lstInv.add(invObj);

        }
        return lstInv;
    }
}