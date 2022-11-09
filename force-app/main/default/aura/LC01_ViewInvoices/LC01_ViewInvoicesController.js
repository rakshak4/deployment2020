({
	handleSubmit: function(component, event, helper) {
      	console.log('handleSubmit');   
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
      	console.log('handleSuccess');   
        // Send event when save Completed
        var compEvent = component.getEvent("editInvoiceEvent");
        compEvent.setParams({
            "hasBeenCompleted" : true 
        });
        compEvent.fire();
    },
    openModel: function(component, event, helper) {
      console.log('openModel');
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);
    },
    closeModel: function(component, event, helper) {
      console.log('closeModel');
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
    }  
})