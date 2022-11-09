/**
 * @description       :
 * @author            : Rakshak Rajjoo
 * @last modified on  : 25/10/2022
 * @last modified by  : Rakshak Rajjoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   25/10/2022   Rakshak Rajjoo   Initial Version
 **/
public with sharing class CaseTriggerHandler {
    /**
    * @description Method to handle after update Event
    * @author Rakshak Rajjoo | 25/10/2022
    * @param List<Case> lstCasNew
    * @param Map<Id Case> mapCasOld
    **/
    public void handleAfterUpdate(List<Case> lstCasNew, Map<Id, Case> mapCasOld) {
        List<Case> lstCasPayment = new List<Case>();
        for (Case casNew : lstCasNew) {
            Case casOld = mapCasOld.get(casNew.Id);

            if (casNew.Status != casOld.Status && casNew.Status == 'Payment') {
                lstCasPayment.add(casNew);
            }
        }

        if (lstCasPayment.size() > 0) {
            AP01_CreateInvoice.createInvoiceFromCase(lstCasPayment);
        }
    }
}