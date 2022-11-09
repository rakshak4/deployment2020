/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Ayman Rummun
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   10-31-2022   Ayman Rummun   Initial Version
**/
({
    openModel: function(component, event, helper)
    {      
        console.log('openModel START')
        component.set('v.showModal', true);
        
    },
    closeModel: function(component, event, helper)
    {
        component.set('v.showModal', false);
    },

    updateRecordOnCLick: function(component, event, helper)
    {
        var event = component.getEvent("childEvent");
        event.setParams({
            "message" : "sucessfully Updated"
        });
        event.fire();
    }
})