/**
 * @File Name          : CaseTrigger.trigger
 * @Description        : As an agent, i want an invoice to be created after a claim has
 *                       been processed so as to issue payment to the customer
 * @Author             : Souhayl Johar
 * @Group              :
 * @Last Modified By   : Souhayl Johar
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      <SJO>      Initial Version
 **/

trigger CaseTrigger on Case(after update) {
  CaseTriggerHandler handler = new CaseTriggerHandler();

  if (Trigger.isAfter && Trigger.isUpdate) {
    
    handler.handlerAfterUpdate(Trigger.new, Trigger.oldMap);
  }

  if(Trigger.isBefore && (Trigger.isInsert ||  Trigger.isUpdate)){

        handler.handleBeforeInsertAndUSpdate(Trigger.new);
  }

}