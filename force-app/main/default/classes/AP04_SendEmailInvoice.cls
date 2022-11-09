/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Chevish Boodhun   Initial Version
**/
public with sharing class AP04_SendEmailInvoice {
    
    public static void sendEmailAfterInvoice(List<Invoice__c> lstNewInv) {

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<Invoice__C> lstInv = [SELECT Name, AmountWithVat__c, Case__r.Type, Case__r.Reason, LastPaymentDate__c, Case__r.DamagedVehicle__r.RegistrationNumber__c, Contact__r.Email__c FROM Invoice__c WHERE Id IN :lstNewInv AND Contact__r.Email__c != NULL];
        for (Invoice__c inv : lstInv) {
            mail.setToAddresses(new String[] {inv.Contact__r.Email__c});
            mail.setSubject('Ti Vitesse: Invoice-' + inv.Name);
            String body = 'Price including VAT: ' + inv.AmountWithVat__c;
            body += '\nCase Type: ' + inv.Case__r.Type;
            body += '\nCase Reason: ' + inv.Case__r.Reason;
            body += '\nLast Payment Date: ' + inv.LastPaymentDate__c;
            body += '\nVehicle Registration Number: ' + inv.Case__r.DamagedVehicle__r.RegistrationNumber__c;
            mail.setPlainTextBody(body);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }

    }

}