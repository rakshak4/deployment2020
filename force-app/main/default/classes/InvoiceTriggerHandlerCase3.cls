/**
 * @File Name          : InvoiceTrigger.trigger
 * @Description        : case study 3: trigger on  As a customer, i should receive an email when my invoice is created
 * @Author             : MJH (Spoon Consulting)
 * @Group              :
 * @Last Modified By   : Mehreen Jhummun
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, 12:09:30             MJH      Initial Version
 **/

public with sharing class InvoiceTriggerHandlerCase3{
    /**
     * @description Method to handle handler after insert
     * @author Mehreen Jhummun | 25/10/2022
     * @return method handler
     **/
    public void handleBeforeDelete(List<Invoice__c> lstNewInv) {
        // handler logic
        List<Invoice__c> lstInv = new List<Invoice__c>();
        for (Invoice__c invNew : lstNewInv) {
            lstInv.add(invNew);
        }
        if (lstInv.size() > 0) {
            AP003_AlertDeleteInvoice.preventDeleteInvoice(lstInv);
        }
    }
}