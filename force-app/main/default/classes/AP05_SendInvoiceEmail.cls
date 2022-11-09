/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Kanigan Somadoo   Initial Version
**/
public with sharing class AP05_SendInvoiceEmail {
    /**
    * @description 
    * @author Kanigan Somadoo | 10-25-2022 
    * @param List<Invoice__c> lstInvoice 
    **/
    public static void sendInvoiceEmail(List<Invoice__c> lstInvoice) {

        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
        List<Invoice__c> lstInvDetails = [SELECT Name, AmountWithVat__c, LastPaymentDate__c, Case__r.Type, Case__r.Reason, Case__r.DamagedVehicle__r.RegistrationNumber__c, Contact__r.Email
        FROM Invoice__c
        WHERE Id IN :lstInvoice AND Contact__r.Email!=NULL];

        for(Invoice__c inv : lstInvDetails){
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setSubject('Ti Vitesse: Invoice- ' + inv.Name);
            mail.setToAddresses(new List<String>{inv.Contact__r.Email});
            mail.setHtmlBody('Price including vat: ' + inv.AmountWithVat__c + 
                                  'Case Type : ' + inv.Case__r.Type + 
                                  'Case Reason: ' + inv.Case__r.Reason + /////////////////////////////////////////////////////
                                  'Last Payement Date ' + inv.LastPaymentDate__c + 
                                  'Vehicle Registration Number ' + inv.Case__r.DamagedVehicle__r.RegistrationNumber__c);

            lstEmail.add(mail);

        }

        if(lstEmail.size() > 0){
            Messaging.sendEmail(lstEmail);
        }
        


    }
}