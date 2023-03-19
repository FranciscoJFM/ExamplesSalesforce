public with sharing class RandomContactFactory
{
	public static List<Contact> generateRandomContacts( Integer noOfContacts, String lastName )
	{
		List<Contact> contacts = new List<Contact>();
		
		for( Integer i = 0; i < noOfContacts; i++ )
		{
			Contact contact = new Contact( FirstName = 'Test item '+i, LastName = lastName );
			contacts.add( contact );
		}
		
		return contacts;
	}
}