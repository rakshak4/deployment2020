/**
 * @File Name          : CaseTrigger.trigger
 * @Description        : <short description>
 * @Author             : Bhoovanyu Dhomah
 * @Group              : 
 * @Last Modified By   : Bhoovanyu Dhomah
 * @Last Modified On   : 10-26-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    DD-MMM-YYYY, HH:MM:SS      <TRIGRAM>      Initial Version
**/
trigger CaseTrigger on Case (after update, after insert, before insert, before update) {
    CaseTriggerHandler handler  = new CaseTriggerHandler();
    if(Trigger.isAfter && Trigger.isUpdate){
        handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);

    }
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        handler.handleBeforeInsert(Trigger.new);
    }
    



}