/**
 * @description       : 
 * @author            : Chevish Boodhun
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Chevish Boodhun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-31-2022   Chevish Boodhun   Initial Version
**/
({
    showToast : function(component, event, helper) {
        let toastEvent = $A.get('e.force:showToast')
        toastEvent.setParams({
            'title': 'Success',
            'message': 'Invoice updated successfully',
            'type': 'success'
        })
        toastEvent.fire()
    }
})