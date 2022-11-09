({
    handleComponentEvent : function(component, event, helper) {
        
        var action = component.get("c.getRelatedInvoices");
        action.setParams({caseId : component.get("v.recordId")});
        action.setCallback(this, function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                    let returnedInvoices=response.getReturnValue();
                    console.log(returnedInvoices);
                    component.set('v.LatestInvoice',returnedInvoices[0]);
                    console.log(returnedInvoices[0]);
                    console.log(returnedInvoices.length);
                    if(returnedInvoices.length>0){  
                        component.set('v.invoices', returnedInvoices);
                        console.log(returnedInvoices.slice(1, returnedInvoices.length));
                    }
            }
            else if (state==="Error"){
                console.log("Error");
            }
        });
        $A.enqueueAction(action);
    },
    handleChildEvent: function (component, event, helper){
        console.log('crdcrdc');
        var message= event.getParam("message");
        helper.showToast(message);
    }

     
})