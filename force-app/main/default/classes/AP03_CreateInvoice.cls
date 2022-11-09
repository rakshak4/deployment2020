/**
 * @File Name          : AP03_CreateInvoice.cls
 * @Description        : Class for implemnting the different methods called by the invoice and case handler
 * @Author             : Jason Ramjaya
 * @Group              :
 * @Last Modified By   : Jason Ramjaya
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022                    JRA         Initial Version
 **/
public with sharing class AP03_CreateInvoice {
    /**
     * @description create an invoice triggered from case object
     * @author Jason Ramjaya | 10-25-2022
     * @param lstCas
     **/
    public static void createInvoiceFromCase(List<Case> lstCas) {
        List<Invoices__c> lstInvNew = new List<Invoices__c>();

        for (Case cas : lstCas) {
            Invoices__c inv = new Invoices__c(Account__c = cas.AccountId, CaseAssignedTo__c = cas.Id, Contact__c = cas.ContactId, LastPaymentDate__c = System.now().addMonths(3));
            lstInvNew.add(inv);
        }

        if (lstInvNew.size() > 0)
            insert lstInvNew;
    }

    /**
     * @description send email to contact after successful creation of invoice
     * @author Jason Ramjaya | 10-25-2022
     * @param lstInvs
     **/
    public static void sendEmail(List<Invoices__c> lstInvs) {
        List<Messaging.SingleEmailMessage> lstEmails = new List<Messaging.SingleEmailMessage>();

        for (Invoices__c inv : [
            SELECT
                Id,
                Name,
                AmountWithVat__c,
                LastPaymentDate__c,
                Contact__r.Email__c,
                CaseAssignedTo__r.Type,
                CaseAssignedTo__r.Reason,
                CaseAssignedTo__r.LoanedVehicle__r.RegistrationNumber__c
            FROM Invoices__c
            WHERE Id IN :lstInvs AND Contact__r.Email__c != NULL
        ]) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

            mail.setToAddresses(new List<String>{ inv.Contact__r.Email__c });
            mail.setSubject('Ti Vitesse: Invoice-<<' + inv.Name + '>>');
            mail.setHtmlBody(
                '<b>Price including VAT: ' +
                inv.AmountWithVat__c +
                '</b><br><b>Case type: ' +
                inv.CaseAssignedTo__r.Type +
                '</b><br><b>Case reason: ' +
                inv.CaseAssignedTo__r.Reason +
                '</b><br><b>Last Payment date: ' +
                inv.LastPaymentDate__c +
                '</b><br><b>Vehicle registration number: ' +
                inv.CaseAssignedTo__r.LoanedVehicle__r.RegistrationNumber__c +
                '</b>'
            );

            lstEmails.add(mail);
        }

        if (lstEmails.size() > 0)
            Messaging.sendEmail(lstEmails);
    }

    /**
     * @description prevent deletion of invoice before last payment date
     * @author Jason Ramjaya | 10-25-2022
     * @param lstInvs
     **/
    public static void preventInvoiceDelete(List<Invoices__c> lstInvs) {
        for (Invoices__c inv : lstInvs) {
            if (inv.LastPaymentDate__c > System.now()) {
                inv.addError('Cannot delete invoice before last payment date');
            }
        }
    }

    /**
     * @description prevent assigning a loaned vehicle to a case
     * @author Jason Ramjaya | 10-25-2022
     * @param lstCases
     **/
    public static void preventRentingLoanedVehicle(List<Case> lstCases) {
        if (lstCases.size() > 0) {
            List<Id> lstVehIds = new List<Id>();

            //get list of vehicle ids for query purpose
            for (Case cas : lstCases) {
                lstVehIds.add(cas.LoanedVehicle__c);
            }

            if (lstVehIds.size() > 0) {
                Map<Id, Vehicles__c> mapVehicles = new Map<Id, Vehicles__c>([SELECT status__c FROM Vehicles__c WHERE status__c = 'loaned' AND Id IN :lstVehIds]);

                if (mapVehicles.size() > 0) {
                    for (Case cas : lstCases) {
                        if (mapVehicles.containsKey(cas.LoanedVehicle__c)) {
                            cas.addError('Cannot assign vehicle that is already on loan');
                        }
                    }
                }
            }
        }
    }
}