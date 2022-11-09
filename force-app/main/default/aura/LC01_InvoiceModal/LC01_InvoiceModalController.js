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
    toggleModal : function(component, event, helper) {

        const value = component.get("v.modalIsOpen")
        component.set("v.modalIsOpen", !value)

    },
    handleUpdate : function(component, event, helper) {
        
        const childEvent = component.getEvent('childEvent')
        childEvent.fire()
        
    }
})