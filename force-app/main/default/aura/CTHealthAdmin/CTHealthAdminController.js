({
    tabSelectHandler : function(component, event, helper) {

        debugger;
    const selectedTabId = event.getParam("id");
    if(selectedTabId==='person'){
        component.set("v.headerTitle", "Person View");
    }else{
            component.set("v.headerTitle", "Location View")

        }
        debugger;
component.set("v.scope", selectedTabId);
    
debugger;
    }
});