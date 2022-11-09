({
    getRelatedInvoiceInformation: function(component, event, helper) {
        // Initialize external Callout to apex
        var action = component.get("c.getRelatedInvoices");
        // set function paramenter value
        action.setParams({
            "caseId": component.get("v.recordId")
        });
        
        // Call server-side apex
        action.setCallback(this, function(response){
            var state = response.getState();
            // verify callout response
            if(state == 'SUCCESS') {
                let returnedInvoices = response.getReturnValue();
                component.set('v.latestInvoice', returnedInvoices[0]);
                if (returnedInvoices.length > 1) {
                    component.set('v.invoices', returnedInvoices.slice(1, returnedInvoices.length));
                }
       		}            
        });
        $A.enqueueAction(action);
    },
	handleSubmit: function(component, event, helper) {
        component.set("v.spinner", true);
    },
    handleSuccess: function(component, event, helper) {
        component.set("v.spinner", false);
        $A.get('e.force:refreshView').fire();
    }
})