({
    showToast: function(component, event, helper){
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title" : "Success",
            "message" : "text changed succesfully",
            "type" : "Success"
        });
        toastEvent.fire();
    }
})