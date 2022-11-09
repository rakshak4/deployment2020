/**
 * @description       : Trigger for claim object
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 26/10/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   25/10/2022   Akhilesh Ramchurn   Initial Version
**/
trigger CaseTrigger on Case (after update, before insert, before update) {

    CaseTriggerHandler handler = new CaseTriggerHandler();
    if(Trigger.isAfter && Trigger.isUpdate){
        handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
    }

    if((Trigger.isBefore && Trigger.isInsert) || (Trigger.isBefore && Trigger.isUpdate)){
        handler.handleBeforeCreateUpdate(Trigger.new);
    }
}