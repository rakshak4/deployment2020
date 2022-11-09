/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   10-28-2022   Bhoovanyu Dhomah   Initial Version
**/
({
    doInit : function(component, event, helper) {
        var recordId = component.get("v.recordId");
        console.log(recordId);
        var action = component.get("c.getInvoices");
        action.setParams({ caseId : recordId });


        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                console.log("here0");
                console.log(response.getReturnValue());
                if(response.getReturnValue().length>0){
                    console.log("here");
                    // component.set("v.showContacts","true");
                    // component.set("v.message","Contacts:");
                    
                    
                    // var inv = response.getReturnValue()[0];
                    component.set("v.invoiceLatest",response.getReturnValue()[0]);
                    if(response.getReturnValue().length>1){
                        component.set("v.invoices",response.getReturnValue().slice(1, response.getReturnValue().length));
                        // component.set("v.invoices",response.getReturnValue());
                    }

                }
                else{
                    // console.log("here2");
                    // component.set("v.message","No Contacts!!");
                    // component.set("v.showContacts","false");
                }
                
            }
            else if (state ==="ERROR"){
                console.log("Error");
            }
        });

        $A.enqueueAction(action);
    }//,
    // callModal: function(component, event, helper){
    //     component.set("v.isModalOpen","true");
    // },
    // closeModal: function(component, event, helper){
    //     component.set("v.isModalOpen","false");
    // }
    
    ,
    handleChildEvent: function(component, event, helper){
        // var isModalOpen = event.getParam('isModalOpen');
        console.log('here 3');
        // component.set('v.isModalOpen',isModalOpen);

        let message = event.getParam("message");

        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "success",
            "type": "success"
        });
        toastEvent.fire();
        

    }
    
})