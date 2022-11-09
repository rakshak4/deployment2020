({
    handleClick : function(component, event, helper) {
        component.set('v.showPopUp', true);
    },

    closeModal : function(component, event, helper) {
        component.set('v.showPopUp', false);
    },

    handleOnSuccess : function(component, event, helper) {
        var compEvent = component.getEvent("childEvent");
        compEvent.setParams({
            "message" : "Votez Vikesh"
        })
        compEvent.fire();
        component.set('v.showPopUp', false);
    }
})