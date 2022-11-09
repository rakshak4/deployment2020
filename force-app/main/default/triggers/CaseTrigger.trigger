/**
 * @File Name          : CaseTrigger.trigger
 * @Description        : case study 1: trigger on As an agent, i want an invoice to be created
 *                       after a claim has been processed so as to issue payment to the customer
 * @Author             : MJH (Spoon Consulting)
 * @Group              :
 * @Last Modified By   : Mehreen Jhummun
 * @Last Modified On   : 26/10/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    25-10-2022, 10:04:30             MJH      Initial Version
 **/
trigger CaseTrigger on Case(after update, before update, before insert) {
    CaseTriggerHandler handler = new CaseTriggerHandler();
    if (Trigger.isAfter && Trigger.isUpdate) {
        handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
    }
    

    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){

        handler.handleBeforeUpdateInsert(Trigger.new);
        
    }

}