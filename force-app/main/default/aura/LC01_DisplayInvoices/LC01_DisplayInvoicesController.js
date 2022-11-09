/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   10-28-2022   Bhavish Nundoo   Initial Version
**/
({
    handleLoad: function(component, event, helper) {

        console.log('handleLoad start')
        var action = component.get("c.getInvoices");
        action.setParams({recordId : component.get('v.recordId')});

        action.setCallback(this, function(response){
            var state = response.getState();

            if(state ==="SUCCESS"){
                console.log('getInvoices success')
                console.log(response.getReturnValue())
                 //let invoices= response.getReturnValue();
                 let returnedInvoices= response.getReturnValue();
                component.set('v.latestInvoice',returnedInvoices[0]);
                if(returnedInvoices.length > 1){
                    component.set('v.invoices',returnedInvoices);
                }
            }
            else if (state ==="ERROR"){
                console.log("Error");
            }
        });
        $A.enqueueAction(action);

    },
    openModel: function(component, event, helper){
        component.set("v.showModal", true);
    },
    closeModel: function(component, event, helper){
        component.set("v.showModal", false);
    },
    submitDetails: function(component, event, helper){
        component.set("v.showModal", false);
    },
    handleEditInvoiceEvent: function(component, event, helper){
        let message = event.getParam('message');
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record has been updated successfully",
            "type": "success"
        });
        toastEvent.fire();
        
    }
    
})