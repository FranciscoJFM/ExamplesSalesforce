global class  jobChangeStatus implements Schedulable {

   public static String CRON_EXP = '0 0 22 1/3 * ?';
   
       global void execute(SchedulableContext ctx) {
        List<Order__c> jobChangState = [SELECT Id,Status__c
            FROM Order__c
            WHERE 	Status__c ='En progreso'];
                if(!jobChangState.isEmpty()) {
			for(Order__c order: jobChangState) {
				order.Status__c = 'Cerrado';
			}
			update jobChangState;
		}
           BatchJobData b = new BatchJobData();
           Database.executeBatch(b, 20);
           
           String jobId = System.schedule('DailyLeadProcessor',
            CRON_EXP, 
            new jobChangeStatus()); 
                         system.debug('data is4:'+jobId);
  
           

       }
    
}