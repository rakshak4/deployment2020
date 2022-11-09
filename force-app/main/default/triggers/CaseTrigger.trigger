trigger CaseTrigger on Case (after update, before insert, before update) {
    CaseTriggerHandler handler = new CaseTriggerHandler();

    if(Trigger.isAfter && Trigger.isUpdate){
        handler.handleAfterUpdate(Trigger.new, Trigger.oldMap);

    }

    //second trigger to prevent create/update on Case.LoanedVehicle__c
    if (Trigger.isBefore && Trigger.isInsert) {
        handler.handlerBeforeInsert(Trigger.new);

    }

    if(Trigger.isBefore && Trigger.isUpdate) {
        handler.handlerBeforeUpdate(Trigger.old);


    }
}