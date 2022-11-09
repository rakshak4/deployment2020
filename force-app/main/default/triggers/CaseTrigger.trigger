/**
 * @description       : Trigger to fire after update on obj case
 * @author            : Keny Poisson
 * @group             :
 * @last modified on  : 10-26-2022
 * @last modified by  : Keny Poisson
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   10-25-2022   Keny Poisson    Initial Version
 **/

trigger CaseTrigger on Case(after update,before insert, before update) {
  CaseTriggerHandler handler = new CaseTriggerHandler();

  if (Trigger.isAfter && Trigger.isUpdate) {
    handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
  }

  if(Trigger.isBefore && Trigger.isInsert ){
    handler.handleAfterInsertUpdate(Trigger.new);
  }

  if (Trigger.isBefore && Trigger.isUpdate){
    handler.handleAfterInsertUpdate(Trigger.new);
  }


}