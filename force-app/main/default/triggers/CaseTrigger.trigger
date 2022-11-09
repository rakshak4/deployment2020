/**
 * @File Name          : caseTrigger.trigger
 * @Description        : Trigger for the object Case/claims
 * @Author             : Jason Ramjaya
 * @Group              :
 * @Last Modified By   : Jason Ramjaya
 * @Last Modified On   : 10-26-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022                    JRA         Initial Version
 **/
trigger caseTrigger on Case(after update, before update, before insert) {
    CaseTriggerHandler handler = new CaseTriggerHandler();

    if (Trigger.isAfter && Trigger.isUpdate) {
        handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
    }

    if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            // if (UserInfo.getProfileId() == '00e7S000000HiH6QAK') {
            //     handler.handleBeforeInsertUpdate(Trigger.new);
            // }
            handler.handleBeforeInsertUpdate(Trigger.new);
        }
    }
}