/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   10-25-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class AP04_SendEmail {
    public AP04_SendEmail() {

    }
    /**
     * @description Method to send an email to the contact of each invoice
     * in the list.
     * @author Bhoovanyu Dhomah | 25/10/2022
     * @return Void.
     **/
    public static void sendEmail(List<Invoice__c> lstInv2){
        for (Invoice__c inv : lstInv2) {
            
            System.debug(inv);
            String[] toAddresses = new String[] {(String)inv.Contact__r.Email}; 
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            System.debug('email:: '+inv.Contact__r.Email);
            System.debug('list email '+toAddresses);
            // String str = new String(inv.Contact__r.Email);
            mail.setToAddresses(toAddresses);
            mail.setSubject('Ti Vitesse: Invoice-' + inv.Id);
            mail.setPlainTextBody('Price including vat: ' + inv.AmountWithVat__c +'\n Case Type: '+ inv.Case__r.Type +'\nCase Reason :'+inv.Case__r.Reason+'\nLast Payment date: '+ inv.LastPaymentDate__c + '\nvehicle registration number '+inv.Case__r.DamagedVehicle__r.RegistrationNumber__c);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

        }
    }
}