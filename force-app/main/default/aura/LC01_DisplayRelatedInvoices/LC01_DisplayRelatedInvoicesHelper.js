/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Rayhaan Beeharry
**/
({
    showToast : function(invoice,message) {
        let toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            'title': invoice+': Success',
            'message':message,
            'type': 'success'
        });
        toastEvent.fire();
    }
})