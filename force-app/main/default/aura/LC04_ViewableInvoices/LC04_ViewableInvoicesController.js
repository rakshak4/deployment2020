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
    viewInvoices : function(component, event, helper) {

        var cmpEvent =  cmo.getEvent("cmpEvent");
        cmpEvent.setParams({
            "message": "Child event fired"
        });
        cmpEvent.fire();

    }
})