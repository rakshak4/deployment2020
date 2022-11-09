/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   28/10/2022   Mehreen Jhummun   Initial Version
**/
public with sharing class LC01_DisplayInvoicesController {
    @AuraEnabled
    public static List<Invoice__c> getInvoices(String caseIdToSearch){
            List<Invoice__c> lstInv=[SELECT Id
                        FROM Invoice__c WHERE Case__c =: caseIdToSearch ORDER BY CreatedDate DESC];
            return lstInv;
}
}

// public with sharing class LC01_DisplayInvoicesController {
//     @AuraEnabled
//     public static List<Invoice__c> getInvoices(String caseIdToSearch){
//             List<Invoice__c> lstInv= new List<Invoice__c>();
//         try{
//             lstInv= [SELECT Id FROM Invoice__c WHERE Case__c =: caseIdToSearch ORDER BY CreatedDate DESC];
            
//         }
//         catch(Exception e){
//             System.debug(e.getMessage());
//         }

//         return lstInv;
// }
// }