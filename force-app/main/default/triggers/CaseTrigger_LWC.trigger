/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 02/11/2022
 * @last modified by  : Narmeen Nehor 
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   02/11/2022   Narmeen Nehor   Initial Version
**/
trigger CaseTrigger_LWC on Case (before insert) {

    //instantiate handler
    AP04_CaseTrigger_LWC handler = new AP04_CaseTrigger_LWC();
    
    if (trigger.isBefore && trigger.isInsert){
        handler.handleBeforeInsert(trigger.new);
    }


}