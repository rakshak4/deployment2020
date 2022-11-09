/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Asma Ghanty 
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-31-2022   Asma Ghanty   Initial Version
**/
({
    showToast : function(component, event, msg) {
        var toastEvent=$A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success",
            "message": msg,
            "type": "success"
        });
        toastEvent.fire();  
    }
})