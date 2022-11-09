/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Rayhaan Beeharry
**/
public with sharing class AP05_PreventDeletion {
    public static void preventDeletion(List<Invoice__c> lstInvoice){
        for(Invoice__c inv : lstInvoice){
            inv.addError( 'Cannot delete invoice before last payment date'); 
        }
    }
}