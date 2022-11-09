/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Rayhaan Beeharry
**/
({
    toggleModal : function(component) {
        component.set("v.showUpdateForm",!component.get("v.showUpdateForm"));
    }
})