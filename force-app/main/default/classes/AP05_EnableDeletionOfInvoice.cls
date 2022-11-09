/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-25-2022   Ayman Rummun   Initial Version
**/
public with sharing class AP05_EnableDeletionOfInvoice {
    public static void unenableDeletionOfInvoiceIfPaymentDateIsBeforeLastDate(List<Invoice__c> lstInv) {

        //List<Invoice__c> lstInvGetRec = [SELECT LastPaymentDate__c FROM Invoice__c WHERE Id IN: lstInv];

        for(Invoice__c inv: lstInv)
        {
            if(inv.LastPaymentDate__c !=null){
                if(inv.LastPaymentDate__c > System.now())
                {
                    inv.adderror('Cannot delete invoice before last payment date');
                }
            }
              
        }
    }
}