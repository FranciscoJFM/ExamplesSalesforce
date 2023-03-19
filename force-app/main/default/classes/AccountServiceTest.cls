@IsTest(SeeAllData=false)
private class AccountServiceTest {
    @Istest
   static void should_create_account(){
       String acctName = 'salesforce';
       String acctNumber = 'Gopi1267';


       Test.startTest();
       
       Account newAcct  =  AccountService.createAccount(acctName,acctNumber);
       insert newAcct;
       System.debug('newAcct:'+ newAcct);
       Test.stopTest();

       List<Account> accts = [SELECT Id,Name,AccountNumber,TickerSymbol FROM Account
       WHERE Id = :newAcct.Id];

       System.assertEquals(1, accts.size(), 'should have found new account');
       System.assertEquals(acctName, accts[0].Name, 'incorrect Name');
       System.assertEquals(acctNumber,accts[0].AccountNumber, 'incorrect account numer');



   }
    
}