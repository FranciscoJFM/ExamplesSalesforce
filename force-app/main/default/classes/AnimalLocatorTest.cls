@isTest
private class AnimalLocatorTest 
{
  @isTest static void testPostCallout() {
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    String expectedValue = AnimalLocator.getAnimalNameById(1);
        System.debug('expectedValue=' + expectedValue);
  }
}