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
    closeModal : function(component, event, helper) {
        component.set('v.showModal','false');
    },

    handleSuccess: function(component, event, helper){
        console.log('handleSuccess');
        //Send event when save completed
        var compEvent = component.getEvent("editInvoiceEvent");
        compEvent.setParams({
            "message" : "Successful"
        });
        compEvent.fire();
    }

})