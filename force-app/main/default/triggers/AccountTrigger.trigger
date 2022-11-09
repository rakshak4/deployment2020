/**************************************************************************************
-- - Author        : Spoon Consulting
-- - Description   : AccountTrigger
--
-- Maintenance History:
--
-- Date         Name  Version  Remarks
-- -----------  ----  -------  -------------------------------------------------------
-- 03-NOV-2022  HMO   1.0     Initial Version
--------------------------------------------------------------------------------------
**************************************************************************************/
trigger AccountTrigger on Account (after insert, after update) {
	AccountTriggerHandler accountHandler = new AccountTriggerHandler();
    
    if(Trigger.isAfter){
        if (Trigger.isInsert){ accountHandler.handleAfterInsert(Trigger.New); }
        
        if (Trigger.isUpdate){ accountHandler.handleAfterUpdate(Trigger.New, Trigger.oldMap); }
    }
}