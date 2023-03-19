({
  
        doInit: function(component, event, helper) {
      /* var action2 = component.get("c.getAccountResult");
            action2.setParams({"currentRecordId":component.get("v.recordId")});
            console.log("recordIdAccount",component.get("v.recordId"));
      
        action2.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.createAcc", response.getReturnValue()[0]);
            }
        });
        $A.enqueueAction(action2);*/
	   
      },
      
    doSave : function(component, event, helper) {
    var consol=JSON.parse(JSON.stringify(component.get("v.createAcc")));
    console.log("Parameters"+ consol);
    var action = component.get('c.createNewContact');
    action.setParams({'param' : consol});
        action.setCallback(this, function(response) {
            
            var getAllValue = component.get('v.createAcc'); 
            var state = response.getState();
            var responses = response.getReturnValue();
            alert(JSON.stringify(responses));
            console.log(responses);

var state = response.getState();
            if (state === "SUCCESS") {
               component.find('notifLib').showToast({
				"variant": "Success",
				"message":"mensajeValidacion.mensaje",
				"mode": "dismissable" 
			});
                                   }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                } 
            }
                     
                           });
        
         $A.enqueueAction(action);
    },
docancel : function(component, event, helper) {
    component.set("v.createAcc", null);
},
       fetchAccounts : function(component, event, helper) {
      /*  var action = component.get("c.fetchAccts");
        action.setParams({ });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acctList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);*/
    },
    
        doInit2: function(component) {
        var apiName = component.get("v.accountLookupApiName");
        component.set("v.fieldsList", [apiName]); // requires a list
    },
  handleSuccess : function(component, event, helper) {  
          
        var params = event.getParams();  
        alert(params.response.id);  
          
    },
   doUpdate :  function(component, event, helper) {
    //var consol=JSON.parse(JSON.stringify(component.get("v.createAcc")));
  //  action.setParams({'accounts' : consol});
    var consol=JSON.parse(JSON.stringify(component.get("v.createAcc")));
        var action = component.get("c.updateMethod");
       action.setParams({"accounts":consol,"recordIds":component.get("v.recordId")});
        action.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
            component.set("v.createAcc", response.getReturnValue());

            }
        });
        $A.enqueueAction(action);
        $A.get('e.force:refreshView').fire();
       
   },})