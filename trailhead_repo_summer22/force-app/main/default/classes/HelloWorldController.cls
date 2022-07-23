public class HelloWorldController {
    
    public Integer myVar = 3;
    public Static Integer myStaticVar = 3;
    
    public HelloWorldController() {//Contructor
        //Declaration
        //Datatype variableName = value;
        //Datatype variableName;
        String contactFirstName = 'suraj';

        //Used to check the current value of the code.
        System.debug(contactFirstName);
        
        //Assert is use to check the code value, meaning
        //It will match with expected value and 
        //Current value.
        //Validate the Logic of Code.
        System.assert(contactFirstName == 'suraj');
    }

    //Method in APEX.
    /*
        There are two types of method, #1: void(not return aything) and #2: non-void(return something)
    */
    //Declare a method:
    //Global/Public/Private void/non-void merthodName(){}

    public void sumTwoNumbers(){
        //LOGIC
        //Decration
        Integer number1 = 12;
        Integer number2 = 56;
        Integer sum = 0;

        //Logical
        sum = number1 + number2;

        //Output
        System.debug(sum);
    } 


    public Integer sumTwoNumbers_withReturn(){
        //LOGIC
        //Decration
        Integer number1 = 12;
        Integer number2 = 56;
        Integer sum = 0;

        //Logical
        sum = number1 + number2;

        //Output
        System.debug(sum);
        return sum;
    } 
    
    
    /******
     * STATIC and NON-STATIC.
     * By Default every method/variable is non-static.
     * *****/
    
    public Static Integer sumTwoNumbers_withReturn_static(){
        //LOGIC
        //Decration
        Integer number1 = 12;
        Integer number2 = 56;
        Integer sum = 0;

        //Logical
        sum = number1 + number2 + myStaticVar;

        //Output
        System.debug(sum);
        return sum;
    } 
}