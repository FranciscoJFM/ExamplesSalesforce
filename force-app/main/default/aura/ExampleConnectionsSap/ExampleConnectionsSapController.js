({
    doInit: function (component, event, helper)
    { 

        component.set('v.columns', [
            {label: 'MATNR', initialWidth: 100,wrapText: 'true', fieldName: 'MATNR', type: 'text', cellAttributes: { alignment:'center',class:'headerBold'}},
            {label: 'WERKS',initialWidth: 190, wrapText: 'true', fieldName: 'WERKS', type: 'text', cellAttributes: { alignment:'center',class:'headerBold'}},
            {label: 'LGORT', initialWidth: 100,wrapText: 'true', fieldName: 'LGORT', type: 'text', cellAttributes: { alignment:'center',class:'headerBold'}},
            {label: 'MEINS',initialWidth: 190, wrapText: 'true', fieldName: 'MEINS', type: 'text', cellAttributes: { alignment:'center',class:'headerBold'}},
            {label: 'ERDAT', initialWidth: 100,wrapText: 'true', fieldName: 'ERDAT', type: 'text', cellAttributes: { alignment:'center',class:'headerBold'}},
            {label: 'VERPR',initialWidth: 190, wrapText: 'true', fieldName: 'VERPR', type: 'text', cellAttributes: { alignment:'center',class:'headerBold'}},
                 ]);
    },
    getCustomerData :  function(component, event, helper)  {
        helper.getMaterialesData(component, event, helper);
    },
})