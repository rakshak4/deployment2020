/**
 * @File Name          : EmailTriggerHandler.cls
 * @Description        : handler for EmailTrigger
 * @Author             : Bhavish Nundoo
 * @Group              :
 * @Last Modified By   : Bhavish Nundoo
 * @Last Modified On   : 10-25-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25/10/2022, HH:MM:SS      BNU      Initial Version
 **/
public with sharing class EmailTriggerHandler {

    /**
     * @description Method .
     * @author Bhavish Nundoo | 25/10/2022
     * @return String The managed object's name.
     **/
    public void handlerAfterInsert(List <Invoice__c> lstInvInc){
        List<Invoice__c> lstinvContact = new List<Invoice__c>();
        
        for (Invoice__c inv : lstInvInc) {
            if (inv.Contact__c != null) {
                lstinvContact.add(inv);
            }
        }
        if(lstinvContact.size()>0){
            AP02_SendEmail.sendMail(lstinvContact);
        }

    }


}