({
	handleSubmit: function(component, event, helper) {
        try{
            event.preventDefault();
            const fields = event.getParam('fields');
            fields.invoiceId = component.get("v.invoiceRecordId");
            component.find('recordEditForm').submit(fields);
            
            // Send event when submitted
            var compEvent = component.getEvent("editInvoiceEvent");
            compEvent.setParams({
                "hasBeenSubmitted" : true 
            });
            compEvent.fire();
        } catch(e){
            console.log(e)
        }
    },
    handleSuccess: function(component, event, helper) {       
        // Send event when save Completed
        var compEvent = component.getEvent("editInvoiceEvent");
        compEvent.setParams({
            "hasBeenCompleted" : true 
        });
        compEvent.fire();
    }
})