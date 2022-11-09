/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Ashita Gopaul
**/
public with sharing class AP03_PreventDeletion {
    public static void PreventDeletion(List<Invoices__c> lstInvPayment){
        for(Invoices__c inv: lstInvPayment){
            inv.addError('Cannot delete invoice before last payment date');
        }
    }
}