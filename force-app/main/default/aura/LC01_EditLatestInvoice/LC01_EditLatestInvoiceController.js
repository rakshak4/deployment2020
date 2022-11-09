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
    openModal : function(component, event, helper){
        component.set("v.showModal", true);
    }
    ,
    closeModal : function(component, event, helper){
        component.set("v.showModal", false);
    },
    handleSuccess : function (component, event, helper){
        console.log("handleSuccess");
        var compEvent = component.getEvent("editInvoiceEvent");
        compEvent.setParams({
            "hasBeenSubmited" : "Successss"
        });
        compEvent.fire();
    }
})