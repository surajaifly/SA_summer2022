public class SA22MapExample {
	//MAP.
	//Map work in key-value pair.
	//one Datatype for Key and one Datatype for Value.
	//Declare a Map.
	//Map<Datatype(Key), Datatype(Value)> mapName = new Map<Datatype(Key), Datatype(Value)>();
	//
	// Month Name by Index.
    public static void mapExampleOne(){
        Map<Integer, String> monthNameByIndexMap = new Map<Integer, String>();
        monthNameByIndexMap.put(1, 'JAN');
        monthNameByIndexMap.put(2, 'FEB');
        monthNameByIndexMap.put(3, 'MAR');
        monthNameByIndexMap.put(4, 'APR');
        
        //Output
        System.debug('MAP LOG 1: ' + monthNameByIndexMap);
        
        //Key can't be duplicate.
        monthNameByIndexMap.put(3, 'March');
        
        //debug view
        System.debug('MAP LOG 2: ' + monthNameByIndexMap);
        
        //Values can be duplicate.
        monthNameByIndexMap.put(3, 'MAR');
        monthNameByIndexMap.put(5, 'APR');
        
        //debug view
        System.debug('MAP LOG 3: ' + monthNameByIndexMap);
        
        //LOOPING ON MAP
        //LOOP ON KEY.
        /*
		* For(Datatype loopVariableName :ListName){}
		*/
        for(Integer varIndex :monthNameByIndexMap.keySet()){
            System.debug('KEY: ' + varIndex);
            System.debug('KEY-VALUE: ' + monthNameByIndexMap.get(varIndex));
        }
        
        //LOOP ON VALUES.
        for(String varMonthName :monthNameByIndexMap.values()){
            System.debug('VALUE: ' + varMonthName);
        }
    }
    
    //Convert a list into Map
    public static void mapExampleTwo(){
    	//Declaration
        List<Contact> contactList = new List<Contact>();
        Map<Id, Contact> contactByIdMap = new Map<Id, Contact>();
        Map<String, Contact> contactByNameMap = new Map<String, Contact>();

        //Logical
        //add Contact List from Salesforce into the List of Contact.
        contactList = [
            SELECT Id, Name, Email, Phone 
            FROM Contact
            ORDER BY Name
            LIMIT 10];
        
        For(Contact cont :contactList){
            contactByIdMap.put(cont.Id, cont);
            contactByNameMap.put(cont.Name, cont);
        }
        
        //OUTPUT
        for(Id contactId :contactByIdMap.keySet()){
            System.debug('KEY: ' + contactId);
            System.debug('KEY-VALUE: ' + contactByIdMap.get(contactId));
        }
        
        for(String contactName :contactByNameMap.keySet()){
            System.debug('KEY: ' + contactName);
            System.debug('KEY-VALUE: ' + contactByNameMap.get(contactName));
        }
    }
}