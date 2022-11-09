/**
 * @description       : Case Trigger
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-25-2022   Kanigan Somadoo   Initial Version
**/
trigger CaseTrigger on Case (before insert, after update, before update) {

    //Instantiate handler

    CaseTriggerHandler handler = new CaseTriggerHandler();

    if(Trigger.isAfter && Trigger.isUpdate) {
        handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
    } 


    if(Trigger.isBefore && Trigger.isInsert){

        System.debug(Trigger.new);
        handler.handleBeforeInsertUpdate(Trigger.new);
        
    }


    if(Trigger.isBefore && Trigger.isUpdate){

       // System.debug(Trigger.new);
        handler.handleBeforeInsertUpdate(Trigger.new);

    }
}