/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 31/10/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   31/10/2022   Mehreen Jhummun   Initial Version
**/
({
    
    openModel : function(component, event, helper) {
        component.set('v.showModel', true);
    },

    closeModel : function(component, event, helper) {
        component.set('v.showModel', false);
    },
    fireComponentEvent : function(cmp, event) {
        // Get the component event by using the
        // name value from aura:registerEvent
        var cmpEvent = cmp.getEvent("childEvent");
        cmpEvent.setParams({
            "invoiceRecord" : "showModel" });
        cmpEvent.fire();
    },
    onSubmitEvent : function(cmp, event) {
        var cmpEvent = cmp.getEvent("childEvent");
        cmpEvent.setParams({
            "message" : "Successful" });
        cmpEvent.fire(); 
    }

   
})