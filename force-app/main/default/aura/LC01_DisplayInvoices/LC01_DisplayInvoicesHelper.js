({
    showToast : function(message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": message,
            "type": "success"
        })
        toastEvent.fire();
    }
})