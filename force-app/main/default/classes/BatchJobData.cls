global class BatchJobData  implements Database.Batchable<sObject>, Database.Stateful, Database.AllowsCallouts {
        public Integer recordsProcessed = 0;
    
    
global Database.QueryLocator start(Database.BatchableContext bc) {
    
    //String  queryL = 'SELECT Status__c FROM Order__c  WHERE Status__c = \'En progreso\'';

return Database.getQueryLocator([SELECT Status__c FROM Order__c  WHERE Status__c = 'En progreso']);
}

global void execute(Database.BatchableContext bc, List<Order__c > records){
for(Order__c  ord : records){
ord.Status__c  = 'Cerrado';
 recordsProcessed = recordsProcessed + 1;

}
update records;
}

global void finish(Database.BatchableContext bc){

          System.debug(recordsProcessed + ' records processed. Packo!');

}
}