/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-28-2022   Chevish Boodhun   Initial Version
**/
({
    init : function(component, event, helper) {

        const caseId = component.get("v.recordId")
        const action = component.get("c.getRelatedInvoices")
        action.setParams({caseId : caseId});
        action.setCallback(this, function(response) {
            const state = response.getState()
            if (state === "SUCCESS") {
                const returnedInvoices = response.getReturnValue()
                const latestInvoice = returnedInvoices[0]
                component.set('v.invoices', returnedInvoices)
                component.set('v.latestInvoice', latestInvoice)
            }
            else if (state === "ERROR") {
                console.log("Error")           
            }
        })
        $A.enqueueAction(action)

    },
    handleChildEvent : function(component, event, helper) {

        helper.showToast()
        
    }
})