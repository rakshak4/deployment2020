/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 31/10/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   31/10/2022   Souhayl Johar   Initial Version
**/
({
    showToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Update Successfull!",
            "message": "Update Successfull!",
            "type": "success"
        });
        toastEvent.fire();

    }
})