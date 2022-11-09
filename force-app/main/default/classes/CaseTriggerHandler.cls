/**
 * @File Name          : CaseTriggerHandler.cls
 * @Description        : Handler for trigger caseTrigger
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : Ayman Rummun
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022      <ARU>      Initial Version
 **/
public with sharing class CaseTriggerHandler {
    /**
     * @description Method to identify the managed object.
     * @author Ayman Rummun | 26/08/2021
     * @return String The managed object's name.
     **/
    /*public void handleAfterUpdate(List<Case> lstNewCas, List<Case> lstOldCas) {

        for(Case casNew: lstNewCas)
        {
            for(Case casOld: lstOldCas)
            {
                if(casNew.Status != casOld.Status)
                {
                    if(casNew.Status == 'Present')
                    {
                        Invoice inv = new Invoice(

                        );
                    }
                }
            }
        }
        
    }*/

    /*public void handleAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
        List<Invoice__c> lstInv = new List<Invoice__c>();

        for (Case casNew : lstNewCas) {
            Case caseRecOld = mapOldCas.get(casNew.id);

            if (casNew.Status != caseRecOld.Status) {
                if (casNew.Status == 'Payment') {
                    Invoice__c inv = new Invoice__c(
                        Case__c = casNew.Id, 
                        Account__c = casNew.AccountId, 
                        Contact__c = casNew.ContactId,
                        LastPaymentDate__c = casNew.CreatedDate.addMonths(3)
                        );

                    lstInv.add(inv);
                }
            }
        }

        if (lstInv.size() > 0) {
            insert lstInv;
        }
    }*/

    public void handleAfterUpdate(List<Case> lstNewCas, Map<Id, Case> mapOldCas) {
        // handler logic
        List<Case> lstInv = new List<Case>();
        for (Case casNew : lstNewCas) {
            Case caseRecOld = mapOldCas.get(casNew.Id); // ggnr value de sa ID new case la, store li dans
            //caseRecOld instance
            if (casNew.Status != caseRecOld.Status && casNew.Status == 'Payment') {
                        lstInv.add(casNew);
                }
            
        }
        if (lstInv.size() > 0) {
            AP04_CreateInvoiceUseCase01.createInvoiceFromCase(lstInv);
        }
    }

    public void handleBeforeInsertUpdate(List<Case> lstNewCas)
    {
        System.debug('Size of lstNewCas: ' + lstNewCas.size());
        List<Case> lstCas = new List<Case>();

        for (Case cas : lstNewCas) {
            if(cas.VehicleId__c != null)
            {
                lstCas.add(cas);
                System.debug('Entering in list');
            }   
        }

        System.debug('Size of lstCas: ' + lstCas.size());
        

        if(lstCas.size()> 0)
        {
            AP06_AvoidCreatingCase.checkBefInsertUpdate(lstCas);
        }
    }
}