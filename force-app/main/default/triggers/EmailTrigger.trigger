/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-25-2022   Asma Ghanty   Initial Version
**/
trigger EmailTrigger on Invoices__c (after insert) {
    EmailTriggerHandler handler = new EmailTriggerHandler();

    if(Trigger.isAfter && Trigger.isInsert){
        handler.handleAfterInsert(Trigger.new);
    }
    

}