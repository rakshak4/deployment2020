/**
 * @File Name          : <CaseTrigger>.trigger
 * @Description        : <short description>
 * @Author             : Spoon Consulting
 * @Group              : 
 * @Last Modified By   : Sambhav Bholah
 * @Last Modified On   : 10-26-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-OCT-222, HH:MM:SS      SBH      Initial Version
**/

trigger CaseTrigger2 on Case (after update, before insert, before update ) {
    /**
    * @description       : 
    * @author            : Sambhav Bholah
    * @group             : 
    * @last modified on  : 10-26-2022
    * @last modified by  : Sambhav Bholah
    **/
    CaseTriggerHandler2 handle = new CaseTriggerHandler2();

    if(trigger.isAfter && trigger.isUpdate){
        handle.handleAfterUpdate(Trigger.new, Trigger.oldMap);
    }

    if(trigger.isBefore && trigger.isInsert ) {
        handle.handleBeforeInsert(Trigger.new);
    }

    if(trigger.isBefore && trigger.isUpdate ) {
        handle.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
    }
    
}