/**
 * @description       : 
 * @author            : Ashita Gopaul
 * @group             : 
 * @last modified on  : 10-28-2022
 * @last modified by  : Ashita Gopaul
**/
public with sharing class AP02_SendEmail {
    public static void sendEmailFromInvoice(List<Invoices__c> lstInNew) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        for (Invoices__c inv : lstInNew) {
            mail.setSubject('Ti Vitesse: Invoice-' + inv.Name);
            
            mail.setToAddresses( new List<String>{inv.Contact__r.Email});
            mail.setPlainTextBody(
                'Price including VAT: ' +
                inv.AmountWithVat__c +
                '\nCase type: ' +
                inv.Case__r.Type +
                '\nCase reason: ' +
                inv.Case__r.Reason +
                '\nLast Payment date: ' +
                inv.LastPaymentDate__c +
                '\nVehicle registration number: ' +
                inv.Case__r.Vehicle__r.RegistrationNumber__c
            );
            if (inv.Contact__r.Email != null){
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
            
        }
    }
}