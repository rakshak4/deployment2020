/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Asma Ghanty
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   10-28-2022   Asma Ghanty   Initial Version
**/
({
    handleLoad : function(component, event, helper) { 
        var action = component.get("c.getRelatedInvoices");
    
        action.setParams({ caseIdToSearch : component.get("v.recordId")});

        action.setCallback(this, function(response){
            var state = response.getState();

            if (state === "SUCCESS"){
                let returnedInvoices = response.getReturnValue();
                component.set('v.latestInvoices', returnedInvoices[0]);
              
                if(returnedInvoices.length > 1){
                    component.set('v.lstInvoices', returnedInvoices);
                
                }                    
            }
            else if (state === "ERROR") {
                console.log("Error");
            }
        });
        $A.enqueueAction(action);
    },

    handleEditInvoiceEvent: function (component, event, helper) {
        var message=event.getParams("message");
        console.log('>>>>>>>>>'+message)
        helper.showToast(component, event, message);
    },
        openModel: function(component, event, helper) {
           // Set isModalOpen attribute to true
           component.set("v.showModal", true);
        },
       
        closeModel: function(component, event, helper) {
           // Set isModalOpen attribute to false  
           component.set("v.showModal", false);
        },
       
        submitDetails: function(component, event, helper) {
           // Set isModalOpen attribute to false
           //Add your code to call apex method or do some processing
           component.set("v.showModal", false);
        }
    
})