/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-26-2022   Kanigan Somadoo   Initial Version
**/
public with sharing class AP06_preventInvDelete {

    //create method to stop deletion


    public static void preventDelete(List<Invoice__c> lstInvoice){

        for(Invoice__c inv : lstInvoice){

            inv.addError('Cannot delete Invoice before last payment date');
        }

    }
   
}