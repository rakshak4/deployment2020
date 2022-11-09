/**
 * @File Name          : InvoiceTrigger.trigger
 * @Description        :   As a customer i should receive an email (contact email) 
 *                         when my invoice is created
 * @Author             : Souhayl Johar
 * @Group              :
 * @Last Modified By   : Souhayl Johar
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      <SJO>      Initial Version
 **/

trigger InvoiceTrigger on Invoice__c (After insert, Before delete) {
    InvoiceTriggerHandler handler = new InvoiceTriggerHandler();

    if (Trigger.isAfter && Trigger.isInsert) {
        handler.handleAfterInsert(Trigger.new);
      }

    if (Trigger.isBefore && Trigger.isDelete ){
        handler.handlerBeforeDelete(Trigger.old);
    }
}