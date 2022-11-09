/**
 * @File Name          : AP003_AlertDeletedInvoice.cls
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
public with sharing class AP003_AlertDeleteInvoice {
    public static void preventDeleteInvoice(List<Invoice__c> lstInv) {
        for (Invoice__c inv : lstInv) {
            if (inv.LastPaymentDate__C > System.now()) {
                inv.adderror('Cannot delete invoice where payment greater than today!!!');
            }
        }
    }
}