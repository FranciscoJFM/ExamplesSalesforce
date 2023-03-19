@isTest 
public class ordesItemAccountTest {
    
    static testMethod void getOrdersTest() {
        
        Account c = new Account(Name='BMW', Email__c='ayjtom@gmail.com');
        insert c;
        
        Order__c ord = new Order__c();
		ord.Status__c ='Abierto';
		ord.Name ='Packo182';
        ord.Order_account__c = c.Id;
		insert ord;
		
		Test.StartTest(); 
        List<Order__c> lstAcc = orderItemAccount.getOrders(c.Id);
		Test.StopTest();
	}
    
     static testMethod void getOrderItemTest() {
        
         Account c = new Account(Name='BMW', Email__c='ayjtom@gmail.com');
         insert c;
         
         Order__c ord = new Order__c();
         ord.Status__c ='Abierto';
         ord.Name ='Packo182';
         ord.Order_account__c = c.Id;
         insert ord;
         
         Order_item__c ordItem = new Order_item__c();
         ordItem.sku__c ='As383';
         ordItem.Name ='Sabritas';
         ordItem.Order_new_item__c = ord.Id;
         insert ordItem;

         Test.StartTest(); 
         List<Order_item__c> lstAcc = orderItemAccount.getOrderItem(ord.Id);
         Test.StopTest();
	}

        static testMethod void getOrderAccountTest() {
        
            Account c = new Account(Name='BMW', Email__c='ayjtom@gmail.com');
            insert c;

            Order__c ord = new Order__c();
            ord.Status__c ='Abierto';
            ord.Name ='Packo182';
            ord.Order_account__c = c.Id;
            insert ord;
		
            Test.StartTest();
            orderItemAccount.getOrderAccount(c.Id);
			Test.StopTest();
	}
    
       /* static testMethod void jobChangeStatusTest1() {        
         test.starttest();
         jobChangeStatus p = new jobChangeStatus(); 
         String chron = '0 0 23 * * ?';        
         system.schedule('Test Sched', chron, p);
         test.stopTest();
    }*/
    
   
       
}