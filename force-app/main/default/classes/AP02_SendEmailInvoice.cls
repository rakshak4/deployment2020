/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-25-2022   Asma Ghanty   Initial Version
**/
public with sharing class AP02_SendEmailInvoice {
    // public AP02_SendEmailInvoice() {

    // }

    /**
    * @description 
    * @author Asma Ghanty | 10-25-2022 
    * @param List<Invoices__c> lstToSendEmail 
    **/
    public static void sendEmail(List<Invoices__c> lstToSendEmail){

        //list to store email subject, body etc..
        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();

        //list to query the selected fields from invoice
        for (Invoices__c inv : [
            SELECT Name, AmountWithVat__c, LastPaymentDate__c, Case__r.Type, Case__r.Reason, Case__r.Vehicle__r.RegistrationNumber__c, Contact__r.Email
            FROM Invoices__c
            WHERE Id IN :lstToSendEmail AND Contact__r.Email!=NULL
        ]){

        

            //check if contact email is not empty
            //if (inv.Contact__r.Email != null) {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

                mail.setToAddresses(new List<String>{ inv.Contact__r.Email }); //set the selected contact email from the form invoice

                mail.setSubject('Ti Vitesse: Invoice-<< ' + inv.Name + ' >>');

                //fields to display in body of email
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

                lstEmail.add(mail); //adding all the data above to the list email
            //}
        }
        if(lstEmail.size()>0){

        Messaging.sendEmail(lstEmail); //sending email
        }
    }
}

    //     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    //     String[] toAddresses = new String[] {Inv.Contact__r.Email};
    //     mail.setToAddresses(toAddresses);
    //     mail.setSubject('Ti Vitesse:' +InvoiceNumber);
    //     mail.setPlainTextBody('Price including vat:' +inv.AmountWithVat__c,
    //                           'Case type:' +inv.Case__r.Type,
    //                           'Case reason:' +inv.Case__r.Reason,
    //                           'Last payment date:' +inv.LastPaymentDate__c,
    //                           'Vehicle Registration Number:' +inv.Case__r.Vehicle__r.RegistrationNumber__c);
    //     // Pass this email message to the built-in sendEmail method 
    //     // of the Messaging class
    //     Messaging.SendEmailResult[] results = Messaging.sendEmail(
    //     new Messaging.SingleEmailMessage[] { mail });
    //     // Call a helper method to inspect the returned results
    //     inspectResults(results);
    // }


    //  // Helper method
    //  private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
    //     Boolean sendResult = true;
    //     // sendEmail returns an array of result objects.
    //     // Iterate through the list to inspect results. 
    //     // In this class, the methods send only one email, 
    //     // so we should have only one result.
    //     for (Messaging.SendEmailResult res : results) {
    //         if (res.isSuccess()) {
    //             System.debug('Email sent successfully');
    //         }
    //         else {
    //             sendResult = false;
    //             System.debug('The following errors occurred: ' + res.getErrors());                 
    //         }
    //     }
    //     return sendResult;
    // }
    // }