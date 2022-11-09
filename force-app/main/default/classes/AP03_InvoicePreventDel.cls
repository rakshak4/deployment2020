/**
 * @description       :
 * @author            : Bhavish Nundoo
 * @group             :
 * @last modified on  : 10-26-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   10-25-2022   Bhavish Nundoo   Initial Version
 **/
public with sharing class AP03_InvoicePreventDel {
    
    /**
     * @description prevent delete an invoice before payment date
     * @author Bhavish Nundoo | 10-25-2022
     * @param List<Invoice__c> lstInvInc
     **/
    public static void preventInvDel(List<Invoice__c> lstInvDel){

        for (Invoice__c inv : lstInvDel) {
            inv.addError('Cannot delete invoice before last payment date');
        }

    }
}