global class batchOrderUpdate implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Status__c FROM Order__c  WHERE Status__c = \'En progreso\'';
        return Database.getQueryLocator(query);
    }
 
    global void execute(Database.BatchableContext BC, List<Order__c> scope)
    {
         for(Order__c a : scope)
         {
             a.Status__c='Cerrado';
         }
         update scope;
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}