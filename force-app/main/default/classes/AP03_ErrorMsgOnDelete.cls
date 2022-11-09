/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-26-2022   Asma Ghanty   Initial Version
**/
public with sharing class AP03_ErrorMsgOnDelete {
    public AP03_ErrorMsgOnDelete(){
    }

    /**
    * @description 
    * @author Asma Ghanty | 10-26-2022 
    * @param List<Invoices__c> lstInvoicesDel 
    **/
    public static void PreventDelInvoice(List<Invoices__c> lstInvoicesDel){

        for(Invoices__c inv: lstInvoicesDel){
            inv.addError('Cannot delete invoice before last payment date');
        }
        
        }


    }