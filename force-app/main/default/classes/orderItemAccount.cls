public class orderItemAccount {
    
    /*a.Un método para saber las ordenes que pertenecen a una cuenta, 
    necesito ver el nombre de la cuenta, 
   el monto total de las ordenes y cuantos items tiene cada orden.*/
    //SELECT Id,Name,Monto_total__c,Order_account__c ,Total_items_c__c,Order_account__r.Name FROM Order__c  WHERE Order_account__c ='0015e00000OqxpCAAR'
    @AuraEnabled
    public static List<Order__c> getOrders(Id accountId) {
        List<Order__c>order=[SELECT Id,Name,Monto_total__c,Order_account__c ,Total_items_c__c,Order_account__r.Name FROM Order__c  WHERE Order_account__c =: accountId];
       system.debug('data is1:'+order);
        return order;
    }
    
    /*b.Un metodo para conocer los ítems de una orden,
      necesito ver el nombre, sku, cantidad y precio.
Order_new_item__r.Order_account__r.Name */
    //SELECT Id,Name,sku__c,Cantidad__c ,precio__c, Order_new_item__c  FROM Order_item__c  WHERE Order_new_item__c  ='a0B5e000002IUTNEA4'
    @AuraEnabled
    public static List<Order_item__c> getOrderItem(Id orderId) {
       List<Order_item__c>orderItem=[SELECT Id,Name,sku__c,Cantidad__c ,precio__c, Order_new_item__c FROM Order_item__c  WHERE Order_new_item__c  =: orderId];
       //system.debug('data is2:'+orderItem[0].Order_new_item__r.Order_account__r.Name);
       return orderItem;
    }
    
    /*c.Un metodo para saber cuantas ordenes tiene una cuenta.*/
    //SELECT count(Order_account__c) FROM Order__c  WHERE Order_account__c ='0015e00000OqxpCAAR'
    @AuraEnabled
    public static void getOrderAccount(Id accountId){
             aggregateresult[] listOfContacts = [SELECT count(Order_account__c) FROM Order__c  WHERE Order_account__c =: accountId];
              system.debug('data is3:'+listOfContacts);
                           
    }
  
}