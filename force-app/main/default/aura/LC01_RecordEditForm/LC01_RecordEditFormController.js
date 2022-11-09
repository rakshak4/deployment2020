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
    
    callModal: function(component, event, helper){
        // var event = component.getEvent("childEvent");
        // event.setParams({
        //     "isModalOpen": "true"
        // });
        // event.fire();
        
        component.set("v.isModalOpen","true");
    },
    closeModal: function(component, event, helper){
        // var event = component.getEvent("childEvent");
        // event.setParams({
        //     "isModalOpen": "false"
        // });
        // event.fire();
        component.set("v.isModalOpen","false");
    },
    handleSuccess: function(component, event, helper){
        console.log('parent');
        var compEvent = component.getEvent("childEvent");
        compEvent.setParams({
            "message": "message 123456"
        });
        compEvent.fire();
    }
})