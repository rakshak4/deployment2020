/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-28-2022   Ayman Rummun   Initial Version
**/
({ 
    handleComponentEvent: function (component, event, helper)
    {
        var action = component.get("c.getInvoices");
        action.setParams(//give ban parameter to the APEX Class
        {
            "caseId": component.get("v.recordId")
        });
        action.setCallback(this, function(response)
        {
            var state = response.getState();
            if(state === "SUCCESS")
            {
                console.log(response.getReturnValue());

                let returnedInvoices = response.getReturnValue();

                console.log("check: ",returnedInvoices);
                component.set('v.latestInvoice', returnedInvoices[0]);
                /*if(returnedInvoices.length > 1){
                    component.set('v.invoiceList', returnedInvoices.slice(1, returnedInvoices.length));
                }*/ 
                component.set('v.invoiceList', response.getReturnValue());

            }
            else if(state === "ERROR"){
                console.log("Error");
            }
        });
        $A.enqueueAction(action);//lance action
    },

    handleChildEvent: function(component, event, helper)
    {
        var message = event.getParam('message');
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": message
        });
        toastEvent.fire();
    }
})