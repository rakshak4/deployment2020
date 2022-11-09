/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   10-25-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class AP_05PreventDelInvoiceBeforeDate {
    public AP_05PreventDelInvoiceBeforeDate() {

    }
    /**
     * @description Method to check if user is trying to delete before payment date.
     * @author Bhoovanyu Dhomah | 25/10/2022
     * @return Void.
     **/
    public static void sendErrorMessageIfBeforeDate(List<Invoice__c> lstInv){
        for (Invoice__c inv: lstInv){
            if(System.now()<inv.LastPaymentDate__c){
                inv.addError('Cannot delete invoice before last payment date');

            }
            
        }
    }
}