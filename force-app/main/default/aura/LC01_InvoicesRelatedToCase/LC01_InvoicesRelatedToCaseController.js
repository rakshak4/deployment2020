/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-28-2022   Kanigan Somadoo   Initial Version
**/
({
    initInvoices : function(component, event, helper) {
        // get recordId of current case
        var caseRecordId = component.get("v.recordId");
        console.log("record ID : ", caseRecordId)
        var action = component.get("c.getInvoices");
        action.setParams({"caseId":caseRecordId});

        action.setCallback(this, function(response){
            var state = response.getState();

            if(state === "SUCCESS"){
                
                let returnedInvoices = response.getReturnValue();
                component.set("v.latestInvoice", returnedInvoices[0]);

                if(returnedInvoices.length > 0 ){
                    component.set("v.lstInvoicesRelatedToCase", returnedInvoices);
                }
            }
            else if(state === "ERROR"){
                console.log("Error retrieveing invoices");
            }

        });

        $A.enqueueAction(action);

    },

    handleEditInvoiceEvent : function(component, event, helper){
        let hasBeenSubmitedMessage = event.getParam("v.hasBeenSubmited");
    } 

})