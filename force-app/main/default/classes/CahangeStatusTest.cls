@isTest 
public class CahangeStatusTest {
         static testMethod void jobChangeStatus2() 
    {
        		try{

                Test.startTest();
           
         Account c = new Account(Name='BMW', Email__c='ayjtom@gmail.com');
         insert c;
        
        List<Order__c> lstorder= new List<Order__c>();
        for(Integer i=0 ;i <50;i++)
        {
            Order__c ord = new Order__c();
            ord.Status__c ='En Progreso';
            ord.Name ='Packo182';
            ord.Order_account__c = c.Id;

            lstorder.add(ord);
        }
        
        insert lstorder;
        
        BatchScheduleUpdate ab = new BatchScheduleUpdate();
         String jobId = System.schedule('jobName','0 5 * * * ? ' ,ab) ;
        Test.stopTest();
                }catch (DmlException e){
            
     List<Order__c> orderList =[Select Status__c From Order__c where Status__c = 'Cerrado'];
     
                    System.assert(orderList[0].Status__c=='Cerrado');
                    //Assert Error Message 

			System.assert( e.getMessage().contains('Insert failed. First exception on ' 
                                                   +'row 0; first error:FIELD_CUSTOM_VALIDATION_EXCEPTION,'),e.getMessage() );

			//Assert field 9

			System.assertEquals(Order__c.Status__c, e.getDmlFields(0)[0]);

			//Assert Status Code 

			System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION' , e.getDmlStatusCode(0) );

                }
    }
    
   

}