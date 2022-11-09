/**
 * @description       : 
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 07/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   25/10/2022   Akhilesh Ramchurn   Initial Version
**/
public with sharing class AP04_SendEmailAfterInvoice {
    public static void sendEmail(List<Invoice__c> lstNewInv){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<Invoice__c> lstInv = [SELECT Name,AmountWithVat__c, Case__r.Type, Case__r.Reason,LastPaymentDate__c, Case__r.DamagedVehicle__r.RegistrationNumber__c, Contact__r.Email FROM Invoice__c WHERE Id IN : lstNewInv AND Contact__r.Email__c <> NUll];
        //List<Me>
        for(Invoice__c inv: lstInv){
           // mail.setToAddresses(new String[] {inv.contact__r.Email__C});
           mail.setToAddresses(new String[] {inv.contact__r.Email});
            mail.setSubject('Ti Vitesse: Invoice-'+ inv.Name);
          
           String body = 'Price Including Vat": '+ inv.AmountWithVat__c;
           body += '\n Case type: '+ inv.Case__r.Type;
           body += '\n Case reason: '+ inv.Case__r.Reason;
           body += '\n Last Payment date: '+ inv.LastPaymentDate__c;
           body += '\n vehicle registration number: ' + inv.Case__r.DamagedVehicle__r.RegistrationNumber__c;

           mail.setPlainTextBody(body);
           Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}