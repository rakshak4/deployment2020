/**
 * @description       : 
 * @author            : Bhavish Nundoo
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Bhavish Nundoo
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   10-31-2022   Bhavish Nundoo   Initial Version
**/
({
   
    handleSuccess: function(component, event, helper){
        var compEvent = component.getEvent("editInvoiceEvent");
        compEvent.setParams({
            "message" : "souhal p koze"
        });
        compEvent.fire();
    }
})