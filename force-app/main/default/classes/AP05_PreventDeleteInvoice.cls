/**
 * @description       : 
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 26/10/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   25/10/2022   Akhilesh Ramchurn   Initial Version
**/
public with sharing class AP05_PreventDeleteInvoice {
    public static void preventDelete(List<Invoice__c> lstdel){
        for(Invoice__c inv: lstdel){
            inv.addError('Invoice cannot be deleted before last payment date');
        }
    }
}