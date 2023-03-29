({
    openModel: function(component, event, helper) {
       $A.createComponent("c:ExampleConnectionsSap",{},
       function(content, status,errorMessage) {
          console.log(status);
          if (status === "SUCCESS") {
             
             component.find('overlayLib').showCustomModal({
                cssClass: "slds-modal_large",
                header: "Materiales",
                body: content,
                showCloseButton:true, 
                
             });
          }
          
       });
    },
 })