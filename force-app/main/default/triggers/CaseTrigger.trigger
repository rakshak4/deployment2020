/**
 * @File Name          : CaseTrigger.trigger
 * @Description        : Trigger to generate an invoice when a case status change to Payment
 * @Author             : Bhavish Nundoo
 * @Group              : 
 * @Last Modified By   : Bhavish Nundoo
 * @Last Modified On   : 10-30-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      BNU      Initial Version
**/
trigger CaseTrigger on Case (before insert, before update, after update) {
    CaseTriggerHandler handler = new CaseTriggerHandler();

    if (Trigger.isAfter && Trigger.isUpdate) {
        handler.handlerAfterUpdate(Trigger.new,Trigger.oldMap);
    }

   

    if (Trigger.isBefore && Trigger.isInsert) {
        handler.handlerBeforeInsert(Trigger.new);
       

    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        handler.handlerBeforeInsert(Trigger.new);
    }

}