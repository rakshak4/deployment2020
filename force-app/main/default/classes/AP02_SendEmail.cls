/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 26/10/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   25/10/2022   Narmeen Nehor   Initial Version
**/
public with sharing class AP02_SendEmail {
    public static void sendEmail(List<Invoice__c> lstToSendEmail) {
        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();

        List<Invoice__c> lstInvoices = [
            SELECT Name, AmountWithVat__c, LastPaymentDate__c, Case__r.Type, Case__r.Reason, Case__r.Vehicle__r.RegistrationNumber__c, Contact__r.Email
            FROM Invoice__c
            WHERE Id IN :lstToSendEmail
        ];

        for (Invoice__c inv : lstInvoices) {
            if (inv.Contact__r.Email != null) {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

                mail.setToAddresses(new List<String>{ inv.Contact__r.Email });

                mail.setSubject('Ti Vitesse: Invoice-<< ' + inv.Name + ' >>');

                mail.setHtmlBody(
                    '<b>Price including VAT :' +
                    inv.AmountWithVat__c +
                    '</b><br><b>Case Type :' +
                    inv.Case__r.Type +
                    '</b><br>Case reason :' +
                    inv.Case__r.Reason +
                    '</b><br><b>Last Payment date :' +
                    inv.LastPaymentDate__c +
                    '</b><br><b>vehicle registration number :' +
                    inv.Case__r.Vehicle__r.RegistrationNumber__c +
                    '</b>'
                );

                lstEmail.add(mail);
            }
        }
        if (lstEmail.size() > 0){
            Messaging.sendEmail(lstEmail);
        }

    }
}