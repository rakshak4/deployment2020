/**
 * @description       : Creates an email object for each invoice and adds it to a list. Emails are then sent
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
public class AP04_SendMailForInvoiceCreation {
    public static void sendMail(List<Invoice__c> lstInvoice) {
        List<Invoice__c> lstInvoiceRec = [
            SELECT Name, AmountWithVAT__c, LastPaymentDate__c, Contact__r.Email, Case__r.Type, Case__r.Reason, Case__r.CustomerVehicle__r.RegistrationNumber__c
            FROM Invoice__c
            WHERE ID IN :lstInvoice AND Contact__r.Email != NULL
        ];
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        List<Messaging.SingleEmailMessage> lstMessages = new List<Messaging.SingleEmailMessage>();
        message.optOutPolicy = 'FILTER';
        for(Invoice__c inv : lstInvoiceRec){            
            // Set the destination to the email address of the related contact
            if(inv.Contact__r.Email == ''){
                inv.addError('Contact has no email address');
                return;
            }
            message.toaddresses= new String[] {inv.Contact__r.Email};
            message.subject = 'Ti Vitesse: Invoice-'+inv.Name;
            // Build body
            String body= '\nPrice including VAT: '+inv.AmountWithVAT__c;
            body+='\n Case type:'+ inv.Case__r.Type;
            body+='\n Case reason:'+inv.Case__r.Reason;
            body+='\n Last Payment date:'+inv.LastPaymentDate__c;
            body+='\n vehicle registration number:'+ inv.Case__r.CustomerVehicle__r.RegistrationNumber__c; 
            message.plainTextBody = body;
            lstMessages.add(message);
        }
        Messaging.sendEmail(lstMessages);
    }
}