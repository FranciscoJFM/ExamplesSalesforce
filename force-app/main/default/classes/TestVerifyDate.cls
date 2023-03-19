@isTest
public class TestVerifyDate {
    @isTest static void testOldDate(){
         Date d = VerifyDate.CheckDates(System.today(),System.today()+1);
        Date d1 = VerifyDate.CheckDates(System.today(),System.today()+60);
    }
    
    @isTest static void testLessThan30Days(){
        Date dateTest = VerifyDate.CheckDates(date.today(), date.today().addDays(20));
        System.assertEquals(date.today().addDays(20), dateTest);
    }
    
    @isTest static void testMoreThan30Days(){
        Date dateTest = VerifyDate.CheckDates(date.today(), date.today().addDays(31));
        System.assertEquals(date.newInstance(2021, 10, 31), dateTest);
    }

}