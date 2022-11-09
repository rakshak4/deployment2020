({
    handleComponentEvent : function(component, event, helper) {
        var action = component.get("c.getInvoices");
        action.setParams({ caseIdToSearch : component.get("v.recordId") });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var responseVal = response.getReturnValue();
                
                console.log(responseVal.length);
                var lastInvoice = responseVal[0];
                component.set('v.invoiceToUpdate', lastInvoice);

                if (responseVal.length > 0) {
                    component.set('v.invoices', responseVal);
                    component.set('v.hasLatest', true);
                }
            } else if (state === "ERROR") {
                console.log("Error");
            }
        })
        $A.enqueueAction(action);
    },

    handleShowToast : function(component, event, helper) {
        var message = event.getParam("message");
        helper.showToast(message);
    }
})