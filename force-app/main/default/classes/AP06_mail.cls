/**
 * @description       :
 * @author            : Keny Poisson
 * @group             :
 * @last modified on  : 10-25-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-25-2022   Keny Poisson   Initial Version
 **/
public with sharing class AP06_mail {

  public static void sendEmail (List<invoice__c> lstInvoice) {
    for (invoice__c inv : lstInvoice) {
      Decimal AmountInclVat = inv.AmountWithVat__c;
      String CaseType = inv.Case__r.Type;
      String Reason = inv.Case__r.Reason;
      Datetime PaymentDate = inv.LastPaymentDate__c;
      String RegMark = inv.Case__r.DamageVehicle__r.RegistrationNumber__c;
      String Email = inv.Contact__r.Email__c;
      String invNum= inv.invoiceNumber__c;

      System.debug('Reason and case type: ' + CaseType + Reason);

      Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
      message.toAddresses = new List<String>{'keny.poisson@spoonconsulting.com'};
      message.optOutPolicy = 'FILTER';
      message.subject = 'Ti Vitesse: Invoice: '+ invNum;
      message.plainTextBody = 'Amount incl Vat: ' + AmountInclVat;
      Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{
        message
      };
      Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

      System.debug('Pass Constructor');

      if (results[0].success) {
        System.debug('The email was sent successfully.');
      } else {
        System.debug('The email failed to send: ' + results[0].errors[0].message);
      }
    }
    System.debug(lstInvoice);
  }
}