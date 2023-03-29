({
    getMaterialesData: function (component, event, helper){
        let self=this;
        var actionValidate=component.get('c.getValuesSap');
        var codeMatts = component.get("v.codeMatt");  
        actionValidate.setParams({ codeMat : codeMatts });
        console.log(codeMatts);
        if(codeMatts !=null && codeMatts !==undefined  ){
            const regex = /^[0-9]*$/;
            const onlyNumbers = regex.test(codeMatts);
            if(onlyNumbers){//    //5540743069
                if(codeMatts !== ''){
                    component.set('v.spinner',true);
                    actionValidate.setCallback(this,function(response)
                    {
                        component.set('v.spinner',false);
                        let dataRetrieved =response.getReturnValue();
                        let estatus=response.getState();
                        console.log(estatus);
                        if(estatus==='SUCCESS')
                        {
                            component.set("v.data", dataRetrieved);
                            if(dataRetrieved.length===0)
                            {
                                self.showToastHelper(component, 'Error','No hay información que mostrar!!','error');
                            }
                        }                                
                        else{
                            var errors = response.getError();
                            if (errors) {
                                if (errors[0] && errors[0].message) {
                                    self.showToastHelper(component, 'Error',errors[0].message,'error');
                                }
                            } 
                        }
                    });
                }else{
                    self.showToastHelper(component, 'Error','Campo obligatorio','error');
                    component.set("v.data", '');
                }
            }else{
                self.showToastHelper(component, 'Error','Ingresa solo números','error');
                component.set("v.data", '');
            }
        }else{
            self.showToastHelper(component, 'Error','Campo obligatorio','error');
            component.set("v.data", '');
        }
        $A.enqueueAction(actionValidate); 
    },
    showToastHelper : function (component, title,message,variant) {
        component.find('notifLib').showToast({
            "title": title,
            "message": message,
            "variant":variant,
            "mode":'dismissable'
        });
    },
})