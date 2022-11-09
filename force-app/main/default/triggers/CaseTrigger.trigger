/**
 * @File Name          : caseTrigger.trigger
 * @Description        : Trigger on case to create invoice
 * @Author             : Ashita Gopaul
 * @Group              :
 * @Last Modified By   : Ashita Gopaul
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      <AGO>      Initial Version
 **/
trigger caseTrigger on Case(after update, before insert, before update) {
    cseTriggerHandler handler = new cseTriggerHandler();
    if (Trigger.isAfter && Trigger.isUpdate) {
        handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
    }
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        handler.handleBeforeInsertUpdate(Trigger.new);
    }

}