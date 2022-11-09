/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 31/10/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   28/10/2022   Souhayl Johar   Initial Version
**/
({
    DoInit : function(component, event, helper) {



        var recId = component.get("v.recordId");
        var action = component.get("c.getInvoices");        
        action.setParams({ caseIdToSearch : recId });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state == "SUCCESS"){
                //component.set("v.invoices",response.getReturnValue());
               // console.log(response.getReturnValue());

                let returnedInvoices = response.getReturnValue();
                component.set('v.latestInvoice', returnedInvoices[0]);
                if (returnedInvoices.length>1){
                    component.set('v.invoices', returnedInvoices);/*.slice(1, returnedInvoices.length)*/
                }

            }

            else if (state == "ERROR"){
                console.log("Error")
            }
        });
        $A.enqueueAction(action);
    },

    handleClick : function(component, event, helper) {
        component.set('v.showModal','true');
    },
  

    closeModel : function(component, event, helper) {
        component.set('v.showModal','false');
    }


})