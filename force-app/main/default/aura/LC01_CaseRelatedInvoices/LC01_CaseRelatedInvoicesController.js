({
    // Method launched automatically on start
	init: function (component, event, helper) {
        // Call helper method to simplify logic 
        helper.getRelatedInvoiceInformation(component, event, helper);
    },
    
    handleEditInvoiceEvent : function(component, event, helper) {
        let hasBeenSubmitted = event.getParam("hasBeenSubmitted");
        let hasBeenCompleted = event.getParam("hasBeenCompleted");
        
        console.log('hasBeenSubmitted -> ' + hasBeenSubmitted);
        console.log('hasBeenCompleted -> ' + hasBeenCompleted);
        
        if (hasBeenSubmitted) {
            helper.handleSubmit(component, event, helper);
        }
        
        if (hasBeenCompleted) {
            helper.handleSuccess(component, event, helper);
        }        
    }
})