/**
 * @File Name          : CaseTrigger.trigger
 * @Description        : Trigger for Case/Claim object
 * @Author             : <Company Name>
 * @Group              : 
 * @Last Modified By   : Rayhaan Beeharry
 * @Last Modified On   : 10-26-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    DD-MMM-YYYY, HH:MM:SS      RBE      Initial Version
**/

trigger CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    CaseTriggerHandler caseTriggerHandler = new CaseTriggerHandler();

    if(trigger.isAfter && trigger.isUpdate){
        caseTriggerHandler.handleAfterUpdate(trigger.new, trigger.oldMap);
    }

    if((trigger.isBefore && trigger.isUpdate) || (trigger.isBefore && trigger.isInsert)){
        caseTriggerHandler.handleBeforeInsertUpdate(trigger.new);
    }
}