/**
 * @description       : 
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 31/10/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   31/10/2022   Akhilesh Ramchurn   Initial Version
**/
({
    showToast : function(component, event, helper){
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "success!",
            "message" : "Invoice successfully updated",
            "type" : "success"
        });
        toastEvent.fire();
    }
})