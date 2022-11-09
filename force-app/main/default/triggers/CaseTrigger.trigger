/**
 * @File Name          : CaseTrigger.trigger
 * @Description        : As an agent, i want an invoice to be created after a claim has been processed so as to issue payment to the customer
 * @Author             : Narmeen Nehor
 * @Group              : 
 * @Last Modified By   : Narmeen Nehor
 * @Last Modified On   : 25/10/2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, HH:MM:SS      SNA      Initial Version
**/

trigger CaseTrigger on Case (after update) {
    CaseTriggerHandler handler = new CaseTriggerHandler();

    if (Trigger.isAfter && Trigger.isUpdate){
        handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
    }


}