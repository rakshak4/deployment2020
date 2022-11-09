/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Chevish Boodhun 
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-26-2022   Chevish Boodhun   Initial Version
**/
public with sharing class AP05_PreventInvoiceDelete {

    public static void preventDelete(List<Invoice__c> lstOldInv) {

        for (Invoice__c inv : lstOldInv) {
            inv.addError('Cannot delete invoice before last payment date.');
        }

    }
    
}