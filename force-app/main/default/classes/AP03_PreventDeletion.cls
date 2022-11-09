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
public with sharing class AP03_PreventDeletion {
    public static void preventInvDel(List<Invoice__c> lstInvDel){

        for (Invoice__c inv : lstInvDel) {
            inv.addError('Cannot delete invoice before last payment date');
        }

    }
    

}