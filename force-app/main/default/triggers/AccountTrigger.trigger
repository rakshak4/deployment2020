/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Rayhaan Beeharry
**/
trigger AccountTrigger on Account (after insert) {
    AccountTriggerHandler accountTriggerHandler = new AccountTriggerHandler();

    if(trigger.isAfter && trigger.isInsert){
        accountTriggerHandler.handleAfterInsert(trigger.new);
    }

}