({
    handleClick : function(component, event, helper) {

        var caseRecordId =component.get("v.recordId");
        console.log('recordId ->',caseRecordId);
        var action =component.get("c.getInvoices");
        action.setParams({"id":caseRecordId});

        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                var lstInvoice= response.getReturnValue();
                component.set('v.latestInvoices', lstInvoice[0])
                if (lstInvoice.length>0){
                    component.set('v.invoices',lstInvoice);
                }
            }
            else if(state==="ERROR"){
                console.log("ERROR");
            }
        });

        $A.enqueueAction(action);

    }
    ,

    showModel : function(component, event, helper) {
        component.set('v.showPopUp',true);
    }

    ,

    closeModal: function(component, event, helper){
        component.set('v.showPopUp',false);
    }

})