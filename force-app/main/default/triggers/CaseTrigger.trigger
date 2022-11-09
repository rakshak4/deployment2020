/**
 * @description       : Trigger on Case
 * @author            : Rakshak Rajjoo
 * @last modified on  : 25/10/2022
 * @last modified by  : Rakshak Rajjoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   25/10/2022   Rakshak Rajjoo   Initial Version
**/
trigger CaseTrigger on Case(after update) {
    CaseTriggerHandler handler = new CaseTriggerHandler();

    if(Trigger.isAfter && Trigger.isUpdate){
        handler.handleAfterUpdate(trigger.new, trigger.OldMap);
    }

}