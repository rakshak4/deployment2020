/**
 * @description       : 
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 31/10/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   31/10/2022   Akhilesh Ramchurn   Initial Version
**/
({
    toggleModal : function(component,event,helper){
        component.set('v.modelIsOpen',!component.get('v.modelIsOpen'));
    },

    handleToast : function(component, event, helper){
        var event = component.getEvent("childEvent");
        event.fire();
    }    
})