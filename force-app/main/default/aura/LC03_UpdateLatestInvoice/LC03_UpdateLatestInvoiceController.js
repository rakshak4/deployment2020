({
    openModel: function(component, event, helper) {
        // Set isModalOpen attribute to true
        component.set("v.showModal", true);
    },
    closeModel: function(component, event, helper) {
        // Set isModalOpen attribute to false  
        component.set("v.showModal", false);
     },
    
     submitDetails: function(component, event, helper) {
        // Set isModalOpen attribute to false
        //Add your code to call apex method or do some processing
        component.set("v.showModal", false);
     },
     handleOnSuccess: function(component, event, helper) {
        
        var event= component.getEvent("childEvent");
        
        event.setParams({
            "message" : "Update invoice"
        })
        
        event.fire();
        component.set("v.showModal", false);
        
     }
})