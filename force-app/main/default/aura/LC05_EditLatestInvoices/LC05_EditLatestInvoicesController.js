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
    handleSuccess : function(component, event, helper) {
        var compEvent = component.getEvent("editInvoiceEvent");
        compEvent.setParams({
            "message" : "Suhayl encore p cozer em"
        });

        compEvent.fire();

    }
})