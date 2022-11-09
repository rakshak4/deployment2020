/**
 * @description       : Trigger for case object
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 10-27-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Chevish Boodhun   Initial Version
**/

trigger CaseTrigger on Case (before insert, before update, after update) {

    CaseTriggerHandler handler = new CaseTriggerHandler();

    if (trigger.isAfter && trigger.isUpdate) {
        handler.handleAfterUpdate(trigger.oldMap, trigger.new);
    }

    if (trigger.isBefore && trigger.isInsert) {
        handler.handleBeforeInsert(trigger.new);
    }

    if (trigger.isBefore && trigger.isUpdate) {
        handler.handleBeforeUpdate(trigger.oldMap, trigger.new);
    }

}