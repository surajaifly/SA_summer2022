public class SA22NonPrimitive {
	//Non-primitive datatypes.
	//LIST, SET, and MAP
	
    
    //LIST:
    /********
     * Desclaration
     * List<datatype> listName = new List<datatype>();
     */
    
    public static void listExample(){
        //Declaration
        List<String> contactNameList = new List<String>();
        
        //Logical
        //add method is used to add values inside a list.
        contactNameList.add('John Brown');
        contactNameList.add('Ed Sharen');
        contactNameList.add('Akon');
        contactNameList.add('Justin Beaber');
        contactNameList.add('Linkin Park');
        
        //Output
        System.debug(contactNameList);
    }
    
    
    /*****
     * WIRE 
     * A method that will call from LWC.
     * @AuraEnabled(Cacheable = true)
    	public static 
     */
    
    @AuraEnabled(Cacheable = true)
    public static List<String> getContactNames(){
        //Declaration
        List<String> contactNameList = new List<String>();
        
        //Logical
        //add method is used to add values inside a list.
        contactNameList.add('John Brown');
        contactNameList.add('Ed Sharen');
        contactNameList.add('Akon');
        contactNameList.add('Justin Beaber');
        contactNameList.add('Linkin Park');
        
        //Output
        System.debug(contactNameList);
        return contactNameList;
    }
    
    /******
     * ASSIGNMENT #1
     * Write an SOQL qurery to get Recently Create 10 Contact Records Name, Phone, and Email.
     * 
     * ASSIGNMENT #2
     * Write an SOQL qurery to get Lead that are belongs to State New york.
     * 
     * ASSIGNMENT #3
     * Create an LWC Component that will display Latest Movie Names with the help of Apex controller
     * method that returning a List of movies. 
     * 
     * */
}