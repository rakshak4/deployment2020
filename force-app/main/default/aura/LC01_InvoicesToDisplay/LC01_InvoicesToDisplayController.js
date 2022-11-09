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
    myAction : function(component, event, helper) {

    },
    handleShowActiveSectionName: function (cmp, event, helper) {
        alert(cmp.find("accordion").get('v.activeSectionName'));
    },
    handleSetActiveSectionC: function (cmp) {
        cmp.find("accordion").set('v.activeSectionName', 'C');
    },
    callModal: function(component, event, helper) {
        component.set("v.isModalOpen", "true");
        // cmp.find("showButton").set(true);
        // var event = component.getEvent("childEvent");
        // var invoice = component.get("invoice");
        // event.setParams({
        //     // "invoiceToEdit": invoice,
        //     "isModalOpen" : true
        // });
        // console.log('here4');
        // event.fire();
    }

    
})