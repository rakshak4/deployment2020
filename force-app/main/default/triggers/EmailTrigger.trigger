/**
 * @File Name          : EmailTrigger.trigger
 * @Description        : Trigger to send mail to customer
 * @Author             : Bhavish Nundoo
 * @Group              : 
 * @Last Modified By   : Bhavish Nundoo
 * @Last Modified On   : 10-25-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      BNU      Initial Version
**/
trigger EmailTrigger on Invoice__c (after insert) {

    EmailTriggerHandler handler = new EmailTriggerHandler();
    if (Trigger.isAfter && Trigger.isInsert) {
        handler.handlerAfterInsert(Trigger.new);
    }

}