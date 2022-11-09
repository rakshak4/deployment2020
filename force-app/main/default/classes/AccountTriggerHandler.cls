/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-08-2022   Chevish Boodhun   Initial Version
**/
public with sharing class AccountTriggerHandler {

    public void handleAfterInsert(List<Account> lstNewAcc) {

        List<Account> lstAcc = new List<Account>();
        for (Account acc : lstNewAcc) {
            if (acc.Email__c != null) {
                lstAcc.add(acc);
            }
        }
        if (lstAcc.size() > 0) {
            AP07_AccountDetailsTiBiz.fetchAccountDetails(lstAcc[0].Id);
        }
        
    }

}