@isTest 
public class JobTest {
 static testMethod void BatchJobDataTest() {

                    
         Account c = new Account(Name='BMW', Email__c='ayjtom@gmail.com');
         insert c;
        List<Order__c> order = new List<Order__c>();
        for (Integer i=0;i<50;i++) {
          
            Order__c ord = new Order__c();
            ord.Status__c ='En Progreso';
            ord.Name ='Packo182';
            ord.Order_account__c = c.Id;
            order.add(ord);

   
        }
        insert order;
       
  
        Test.startTest();
        BatchJobData jobS = new BatchJobData();
        Id batchId = Database.executeBatch(jobS,order.size());
     //Database.executeBatch(jobS, 90);
        Test.stopTest();
      // System.assertEquals(50, [select count() from Order__c where Status__c='Cerrado']);
      
     List<Order__c> orderList =[Select Status__c From Order__c where Status__c = 'Cerrado'];
     
         System.assert(orderList[0].Status__c=='Cerrado');

        
            /*BatchJobData b = new BatchJobData();
        Database.executeBatch(b);
        Test.stopTest();
    Order__c[] accUpdatedList = [SELECT Id, Status__c FROM Order__c];
    System.assert(accUpdatedList[0].Status__c.Contains('En progreso'));*/
    }
}