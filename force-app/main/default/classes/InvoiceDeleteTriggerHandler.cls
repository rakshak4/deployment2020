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
public with sharing class InvoiceDeleteTriggerHandler {
    public InvoiceDeleteTriggerHandler() {


    }
    /**
         * @description Method to check if lastpayment is not null and is not todays date.
         * @author Bhavish Nundoo| 26/10/2022
         * @return String The managed object's name.
         **/

    public void handlerBeforeDelete(List<Invoice__c> lstInvDel){
        List<Invoice__c> lstInvWithPaymt = new List<Invoice__c>();
        for (invoice__c inv : lstInvDel) {
            if(inv.LastPaymentDate__c!= null){
                if(inv.LastPaymentDate__c > System.now()){
                lstInvWithPaymt.add(inv);
            }

            }
            
        }
        if (lstInvWithPaymt.size()>0) {
            AP03_InvoicePreventDel.preventInvDel(lstInvWithPaymt);
        }
       
    }

    
}