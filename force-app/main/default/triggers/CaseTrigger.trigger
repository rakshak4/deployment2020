/**
 * @File Name          : CaseTrigger.trigger
 * @Description        : Trigger on Object Case
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
trigger CaseTrigger on Case (Before Insert, Before Update, After Update) {

    CaseTriggerHandler handler = new CaseTriggerHandler();

    if(trigger.isAfter && trigger.isUpdate)
    {
        handler.handleAfterUpdate(trigger.new, trigger.oldMap);
    }

    if(trigger.isBefore && trigger.isInsert)
    {
        handler.handleBeforeInsertUpdate(trigger.new);
    }

    if(trigger.isBefore && trigger.isUpdate)
    {
        handler.handleBeforeInsertUpdate(trigger.new);
    }

}