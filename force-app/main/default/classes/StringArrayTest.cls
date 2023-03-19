public class StringArrayTest {

    public static List<String> generateStringArray(Integer n){
        List<String> listToReturn = new List <String>();
        for(Integer i = 0; i<n ;i++){
            listToReturn.add('Test'+i);
        }
       return listToReturn; 
    }
}