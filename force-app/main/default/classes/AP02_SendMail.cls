/**
 * @description       : 
 * @author            : Sambhav Bholah
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Sambhav Bholah
**/
public with sharing class AP02_SendMail {

    public static void sendEmail(List<Invoice__c> lstInv){

        
        system.debug('intial \n' + lstInv);
        List<Invoice__c> lstInvToSend = [SELECT name, AmountWithVat__c, LastPaymentDate__c , Case__r.Reason ,Case__r.Damage_type__c, Case__r.LoanToVehicle__r.RegistrationNumber__c FROM Invoice__c WHERE Id IN :lstInv];
        system.debug(' \n Here:' + lstInvToSend);

        List<Messaging.SingleEmailMessage> lstMailToSend = new List<Messaging.SingleEmailMessage>();
        

        for (Invoice__c inv : lstInvToSend) {

            system.debug(' \n start loop \n');
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setToAddresses(new string[] {'sambhav.bholah@spoonconsulting.com'});
            message.setSubject('Ti vitesss: ' + inv.name);
            message.setPlainTextBody(
                'Price including VAT: ' + inv.AmountWithVat__c + '\n' +
                'Case type: ' + inv.Case__r.Damage_type__c  + '\n' +
                'Case reason: ' + inv.Case__r.Reason   + '\n' +
                'Last Payment date: ' + inv.LastPaymentDate__c + '\n' +
                'vehicle registration number: ' + inv.Case__r.LoanToVehicle__r.RegistrationNumber__c  + '\n' 
             );
            lstMailToSend.add(message);
            system.debug(message);
            
            system.debug(' \n end loop \n');
        }
        system.debug('final list after this \n' + lstMailToSend);

        if(lstMailToSend.size() > 0 ){
            Messaging.sendEmail(lstMailToSend);
        }  
    }

    public static void preventDelete(List<Invoice__c> lstInvWithPayment){
        for(Invoice__c inv: lstInvWithPayment){
            inv.addError('Cannot delete invoice before last payment date');
        }
    }  
}