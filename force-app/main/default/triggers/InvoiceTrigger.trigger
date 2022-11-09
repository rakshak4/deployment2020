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

trigger InvoiceTrigger on Invoice__c (after insert, before delete) {
    /**
     * @description       : 
     * @author            : Sambhav Bholah
     * @group             : 
     * @last modified on  : 10-26-2022
     * @last modified by  : Sambhav Bholah
    **/
    InvoiceTriggerHandler handle = new InvoiceTriggerHandler();

    if(trigger.isAfter & trigger.isInsert){
        handle.handleAfterInsert(Trigger.new);
    }

    if(trigger.isBefore & trigger.isDelete){
        handle.handleBeforeInsert(Trigger.old);
    }

}