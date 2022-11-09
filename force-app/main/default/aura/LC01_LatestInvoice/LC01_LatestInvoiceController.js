({
    handleSuccess : function(component, event, helper) {
        console.log('handleSuccess');
        //send event when completed
        var compEvent = component.getEvent("EditInvoiceEvent");
        compEvent.setParams({
            "messsage": "working"
        });
        compEvent.fire();
    },

    handleEditInvoiceEvent: function(component, event, helper){
        let hasBeenSubmitted = event.getParems('message');
        //same for has been completed

        //if hassubmitted good> show toast
    },
    
    openModel : function(component, event, helper){
        console.log('here start');
        component.set('v.showModel', true);
        console.log('here end');
    },
    
    closeModel : function(component, event, helper){
        console.log('here start');
        component.set('v.showModel', false);
        console.log('here end');
    }
})