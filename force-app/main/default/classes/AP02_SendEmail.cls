/**
 * @description       :
 * @author            : Bhavish Nundoo
 * @group             :
 * @last modified on  : 10-25-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   10-25-2022   Bhavish Nundoo   Initial Version
 **/
public with sharing class AP02_SendEmail {
    public AP02_SendEmail() {
    }

    /**
     * @description send mail to customer using contact email
     * @author Bhavish Nundoo | 10-25-2022
     * @param List<Invoice__c> lstInvInc
     **/
    public static void sendMail(List<Invoice__c> lstInvInc) {
        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
        List<Invoice__c> lstInv = [
            SELECT Id, Name, AmountWithVat__c, LastPaymentDate__c, Case__r.Type, Case__r.Reason, Case__r.Vehicle__r.RegistrationNumber__c, Contact__r.Email__c
            FROM Invoice__c
            WHERE Id IN :lstInvInc
        ];// Query invoice to get the required data for the body of the email and add it to a list
        for (Invoice__c inv : lstInv) { // loop through the select list 
            if (inv.Contact__r.Email__c != null) { // check if contact has an email address.
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new List<String>{ inv.Contact__r.Email__c };
                mail.setToAddresses(toAddresses);
                mail.setSubject('Ti Vitesse:' + inv.Name);
                // display the required field in the body
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
                lstEmail.add(mail);// add the formated mail to the email list
            }
        }
        if (lstEmail.size()>0) {
            Messaging.sendEmail(lstEmail);
        }
        
    }
}