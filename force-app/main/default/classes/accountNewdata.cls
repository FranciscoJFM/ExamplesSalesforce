@isTest
public class accountNewdata {
    
    @isTest
    static void searchForContacts_Test() {    
     Account accountTest=new Account(name='Test1',
                                     LastName__c='Test1');   
        insert accountTest;
        
        Contact contactTest= new Contact(firstname='Test',
                                         lastname='Test',
                                         AccountId=accountTest.Id);
        insert contactTest;
        test.startTest();
        
      List<Contact>listTest = exampleAccountList.searchForContacts();

        
        System.assert(listTest.size() > 0);

        test.stopTest();    
    }
    
     @isTest    
    public static void insertAcc_test(){
        
         Account accountTestInsert=new Account(name='Test1',
                                     LastName__c='Test1');   
        insert accountTestInsert;
        
        Contact contactTestInsert= new Contact(firstname='Test',
                                         lastname='Test',
                                          AccountId=accountTestInsert.Id);
        insert contactTestInsert;
        test.startTest();
               
        exampleAccountList.insertAcc();     
                                                                              
            test.stopTest();
                                         
                                     
    }
    
         @isTest    
    public static void updateRecord_test(){
        
  
  		Contact updateTestContact=new Contact(LastName='flores',FirstName='Paco',AssistantName='ayudantes');
		insert updateTestContact;                

		Contact contactUpdate =  [SELECT Id,AssistantName FROM Contact WHERE AssistantName = : 'ayudantes'];
		System.assertEquals('ayudantes', updateTestContact.AssistantName);

		update 	contactUpdate;
        
          test.startTest();
               
        exampleAccountList.updateRecord();        
                                                                              
            test.stopTest();
    
    }
    
      @isTest    
    public static void createNewContact_test(){
                
         Account accountTestCreate=new Account(name='Test1',
                                     LastName__c='Test1',
                                              Phone__c='324545',
                                              Email__c='sd@sd.com');   
        
        test.startTest();
                
   exampleAccountList.createNewContact(accountTestCreate);
        
                                                                              
            test.stopTest();
                                         
                                     
    }
    
       @isTest
    static void fetchAccts_Test() {    
     Account accountTest=new Account(name='Test1',
                                     LastName__c='Test1');   
        insert accountTest;
        
              List<Account>listAccount = exampleAccountList.fetchAccts();

                        System.assert(listAccount.size() > 0);

        test.stopTest();    
    }
    
    

    
   /*public static void createTestRecords(Integer numAccts, Integer numContactsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Contact> cons = new List<Contact>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];            
            for (Integer k=numContactsPerAcct*j;k<numContactsPerAcct*(j+1);k++) {
                cons.add(new Contact(firstname='Test'+k,
                                     lastname='Test'+k,
                                     AccountId=acct.Id));
            }
        }
        insert cons;
    }   */
}