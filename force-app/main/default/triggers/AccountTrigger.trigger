/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-08-2022   Chevish Boodhun   Initial Version
**/
trigger AccountTrigger on Account (after insert) {

    AccountTriggerHandler handler = new AccountTriggerHandler();

    if (trigger.isAfter && trigger.isInsert) {
        handler.handleAfterInsert(trigger.new);
    }

}