({
    handleClick : function(component, event, helper) {
        let idFetched2 = component.get("v.recordId");

        let action = component.get("c.getRelatedInvoices");
        action.setParams({ idFetched : idFetched2 });
        
        action.setCallback(this, function(response){           
            var state = response.getState();
            if (state === "SUCCESS"){
                //console.log(response.getReturnValue());
                component.set('{!v.lstInvoice}', response.getReturnValue());

                let returnedInvoices = response.getReturnValue();
                console.log(returnedInvoices);
                component.set('v.latestInvoice',  returnedInvoices[0]);
                if (returnedInvoices.length > 1){
                    component.set('v.lstInvoice' , returnedInvoices);
                }
            }
            else if (state === "ERROR"){
                console.log("ERROR");
            }
        });        
        $A.enqueueAction(action);
        
    },
    
    handleSuccess : function (component, event, helper){
        let message = event.getParems('message');
        helper.showToast();
    }
})