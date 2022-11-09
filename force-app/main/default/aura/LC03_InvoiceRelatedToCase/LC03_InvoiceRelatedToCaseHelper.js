/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 31/10/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   31/10/2022   Narmeen Nehor   Initial Version
**/
({
    // showToast : function(component, event, helper) {
    //     var toastEvent = $A.get("e.force:showToast");
    //     toastEvent.setParams({
    //         "title": "Update Success!",
    //         "message": "Your records have been changed successfully",
    //         "type": "success"
    //     });
    //     toastEvent.fire();

    

    handleEditInvoiceEvent : function(component, event, helper){
        let message = event.getParam("message");
    },

    showToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Update Success!",
            "message": "Your records have been changed successfully",
            "type": "success"
        });
    toastEvent.fire();
    }
})