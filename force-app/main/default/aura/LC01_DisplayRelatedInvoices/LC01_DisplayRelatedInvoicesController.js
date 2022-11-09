/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Rayhaan Beeharry
**/
({
    displayInvoices : function(component, event, helper) {         
        var action = component.get("c.getRelatedInvoices");        
        action.setParam("caseId",component.get("v.recordId"));
        action.setCallback(this, function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var latestInvoice, invoices;
                invoices = response.getReturnValue();
                latestInvoice = invoices.shift();   
                // console.log(JSON.stringify(latestInvoice));
                console.log(invoices);     

                component.set("v.latestInvoice",latestInvoice);
                console.log(component.get("v.latestInvoice"));
                component.set("v.invoices",invoices);
            }
            else if(state==='ERROR'){
                console.log('Error boi');
            }
        });
        $A.enqueueAction(action);
    },
    showUpdateResult : function (component, event,helper){
        console.log(event.getParam("invoice"))
        helper.showToast(event.getParam("invoice"), event.getParam("message"));
    }
})