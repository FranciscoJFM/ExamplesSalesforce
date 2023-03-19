public with sharing class AccountService{
    
    public static Account createAccount(String accountName,String accountNumber){
        Account newAcct = new Account(
            Name = accountName,
            AccountNumber = accountNumber,
            TickerSymbol = accountNumber
        );

        return newAcct;

    }
}