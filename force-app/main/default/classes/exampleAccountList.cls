public class exampleAccountList {

    @AuraEnabled
    public static List<Account> getOrderData(Id accountId) {
        List<Account> accounts = [select Id,Name,LastName__c from Account where Id =: accountId];
        system.debug('Is data:'+accounts);

        return accounts;
    }
    
   
}