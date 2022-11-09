/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 31/10/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   28/10/2022   Mehreen Jhummun   Initial Version
**/
({
    doInit : function(component, event, helper) {
       

        var action = component.get("c.getInvoices");
        var recordId = component.get("v.recordId");

        action.setParams({caseIdToSearch:recordId});
        
        action.setCallback(this, function(response)
        {
            var state = response.getState();
            if(state === "SUCCESS")
            {
                // if(response.getReturnValue().length>0)
                let returnedInvoices= response.getReturnValue();
                component.set('v.LatestInvoice', returnedInvoices[0]);
                if(returnedInvoices.length>1)
                {
                    // component.set('v.showInvoices', true);
                    component.set('v.invoiceList',returnedInvoices);
                }
                component.set('v.invoiceList', response.getReturnValue());
            }
            else if(state ==="ERROR")
            {
                console.log("Error");
            }
        });
        $A.enqueueAction(action);

    },
    handleChildEvent: function(component, event, helper){
        var message = event.getParam('message');
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": message
        });
        toastEvent.fire();
    }
    // openModel : function(component, event, helper) {
    //     component.set('v.showModel', true);
    // },

    // closeModel : function(component, event, helper) {
    //     component.set('v.showModel', false);
    // }
    // },



    // handleChildEvent: function(component, event, helper){
    //     var message = event.getParam('message');
    //     component.set('v.latestInvoice"', message);
    // }


})