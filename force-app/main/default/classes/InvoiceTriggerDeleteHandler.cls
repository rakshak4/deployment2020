/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 26/10/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   26/10/2022   Narmeen Nehor   Initial Version
**/
public with sharing class InvoiceTriggerDeleteHandler {
    public void handlerBeforeDelete (List<Invoice__c> lstInvDel) {
        List<Invoice__c> lstInvWithPaymt = new List<Invoice__c>();
        for (invoice__c inv : lstInvDel) {
            if(inv.LastPaymentDate__c!= null){
                if(inv.LastPaymentDate__c > System.now()){
                lstInvWithPaymt.add(inv);
            }

            }
            
        }
        if (lstInvWithPaymt.size()>0) {
            AP03_PreventDeletion.preventInvDel(lstInvWithPaymt);
        }

    }
}