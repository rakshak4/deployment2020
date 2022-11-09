/**
 * @File Name          : AP03_SendingEmailForUseCase02.cls
 * @Description        : Class to send Email if an invoice is created
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : Ayman Rummun
 * @Last Modified On   : 10-25-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022      <ARU>      Initial Version
 **/
public with sharing class AP03_SendingEmailForUseCase02 {
    public static void sendMail(List<Invoice__c> lstInv) {

        String address, subject, body;

        List<Invoice__c> lstInvGetRecords = [SELECT Name, Contact__r.Email__c,AmountWithVat__c, Case__r.Type, Case__r.Reason, Case__r.VehicleId__r.RegistrationNumber__c, LastPaymentDate__c FROM Invoice__c WHERE Id In: lstInv];

        for(Invoice__c inv: lstInvGetRecords)
        {
            address = inv.Contact__r.Email__c;
            subject = 'Ti Vitesse: Invoice-'+ inv.Name;
            body = '  Price including VAT-' + inv.AmountWithVat__c +
            '  Case type-'+ inv.Case__r.Type +
            '  Case reason-'+ inv.Case__r.Reason +
            '  Last Payment date-'+ inv.LastPaymentDate__c +
            '  vehicle registration number-'+ inv.case__r.VehicleId__r.RegistrationNumber__c;
            
        
            // Create an email message object
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new List<String>{ address };
            mail.setToAddresses(toAddresses);
            mail.setSubject(subject);
            mail.setPlainTextBody(body);
            // Pass this email message to the built-in sendEmail method
            // of the Messaging class
            Messaging.SendEmailResult[] results = Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ mail });
            // Call a helper method to inspect the returned results
            inspectResults(results);
        }
    }
    // Helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results.
        // In this class, the methods send only one email,
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            } else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());
            }
        }
        return sendResult;
    }
}