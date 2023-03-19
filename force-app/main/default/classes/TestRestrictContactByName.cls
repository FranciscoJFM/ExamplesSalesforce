@isTest
private class TestRestrictContactByName {

    static testMethod void  metodoTest() 
    {
    
        List<Contact> listContact= new List<Contact>();
        Contact contact = new Contact(FirstName='Paco', LastName='Flores' , email='test1@test.com');
        Contact contact1 = new Contact(FirstName='Paco', LastName = 'Morales',email='test2@test.com');
        listContact.add(contact);
        listContact.add(contact1);
        
        Test.startTest();
            try
            {
                insert listContact;
            }
            catch(Exception ee)
            {
            }
        
        Test.stopTest(); 
        
    }
    
}