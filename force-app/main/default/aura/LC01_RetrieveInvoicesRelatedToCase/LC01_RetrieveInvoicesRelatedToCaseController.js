/**
 * @description       : 
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 31/10/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   28/10/2022   Akhilesh Ramchurn   Initial Version
**/
({
    init : function(component, event, helper) {
        
        const caseId = component.get('v.recordId');
        var action = component.get("c.getRelatedInvoices");
        //console.log(caseId);
        action.setParams({caseId: caseId});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                //console.log( response.getReturnValue());
                // component.set('v.contacts', response.getReturnValue());
                // if(response.getReturnValue().length>0){ 
                //     component.set('v.showContacts',true)
                // }
                // else{
                //     component.set('v.showContacts',false)
                // }
                const returnedInvoices = response.getReturnValue();
                const latestInvoice = returnedInvoices.shift();
                //const latestInvoice = returnedInvoices[0];
                //console.log(latestInvoice);
                component.set('v.invoices', response.getReturnValue());
                component.set('v.latestinvoice',latestInvoice);
            }
            else if (state ==="ERROR"){
                console.log('Error');
            }
        });

        $A.enqueueAction(action);
    },

    handleChildEvent: function(component,event,helper){
        helper.showToast();
    }

   
})