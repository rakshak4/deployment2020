/**
 * @description       : Logic class to send email when invoice is created
 * @author            : Rakshak Rajjoo
 * @last modified on  : 25/10/2022
 * @last modified by  : Rakshak Rajjoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   25/10/2022   Rakshak Rajjoo   Initial Version
 **/
public with sharing class AP02_SendEmail {
    /**
     * @description Method to send email to invoice contact
     * @author Rakshak Rajjoo | 25/10/2022
     * @param List<Invoice__c> lstInv
     **/
    public static void sentEmailToContact(List<Invoice__c> lstInv) {
        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
        // List<Invoice__c> lstInvDetails = ;

        for (Invoice__c inv : [
            SELECT Id, Name, Case__c, AmountWithVat__c, Case__r.Type, Case__r.Reason, LastPaymentDate__c, Case__r.Vehicle__r.RegistrationNumber__c, Contact__r.Email
            FROM Invoice__c
            WHERE Id IN :lstInv AND Contact__r.Email != NULL
        ]) {
            // if (inv.Contact__r.Email != null) {
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
            // }
        }

        if (lstEmail.size() > 0) {
            Messaging.sendEmail(lstEmail);
        }
    }
}