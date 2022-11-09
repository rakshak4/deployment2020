/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Kanigan Somadoo 
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-31-2022   Kanigan Somadoo   Initial Version
**/
({
    showToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record has been updated successfully."
        });
        toastEvent.fire();
    }
})