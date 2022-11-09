/**
 * @description       : 
 * @author            : Aaliyah Mohungoo
 * @group             : 
 * @last modified on  : 31-10-2022
 * @last modified by  : Aaliyah Mohungoo
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   28-10-2022   Aaliyah Mohungoo   Initial Version
**/
({
    doInit: function(component, event, helper) {
        var action = component.get("c.getInvoice");
        
        action.setParams({
            "caseId" : component.get("v.recordId")
        });

        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                let returnedInvoices = response.getReturnValue();
                component.set('v.latestInvoice', returnedInvoices[0]);
                if(returnedInvoices.length > 1){
                 //   component.set('v.listInvoices', returnedInvoices.slice(1,returnedInvoices.length));
                 component.set('v.listInvoices', returnedInvoices);
                }
            }
            else if (state === "ERROR"){
                console.log("Error");
            }
        });
        $A.enqueueAction(action);
    },
   
    handleChildEvent: function(component, event, helper){
        var message = event.getParam('message');
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": message
        });
        toastEvent.fire();
    }
})