/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 26/10/2022
 * @last modified by  : Souhayl Johar 
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   26/10/2022   Souhayl Johar   Initial Version
**/
public with sharing class AP03_PreventDeletionOfInvoice {
    public static void preventInvDel(List<Invoice__c> lstInvDel){

        for (Invoice__c inv : lstInvDel) {
            inv.addError('Cannot delete invoice before last payment date');
        }

    }
    

}