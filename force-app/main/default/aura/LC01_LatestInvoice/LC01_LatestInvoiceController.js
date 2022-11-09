/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Rayhaan Beeharry
**/
({
    toggleUpdateForm : function(component,event,helper) {
        helper.toggleModal(component);
    },

    handleSuccess : function(component,event,helper) {
        var payload = event.getParams().response;
        var objJSON = JSON.parse(JSON.stringify(payload));
        var compEvent = component.getEvent("childUpdatedEvent");
        compEvent.setParams({
            "message" : "Updated invoice successfully",
            "invoice" : objJSON["fields"]["Name"]["value"]
        });
        compEvent.fire();
        helper.toggleModal(component);
        // console.log('success');
    }
})