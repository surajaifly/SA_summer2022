trigger ContactTrigger on Contact (before insert, after insert, before Update, after update) {
	//In the trigger we have a concept of trigger.new 
	//trigger.new  --> List<sObject>
	//in ource, trigger.new is List<Contact>
	
    //we are calculating the age of a contact based on its Birthdate.
    if(trigger.isBefore){
        if(trigger.isInsert){
            ContactTriggerHelper.beforeInsert(trigger.new);
        }
        if(trigger.isUpdate){
            ContactTriggerHelper.beforeUpdate(trigger.new, trigger.oldMap);
        }
    
    //When a contact is created, we need to show the total number of a contact on the Account.
    }else{
        if(trigger.isInsert){
            ContactTriggerHelper.afterInsert(trigger.new);
        }
        if(trigger.isUpdate){
            ContactTriggerHelper.afterUpdate(trigger.new, trigger.oldMap);
        }
        
    }
    
    /*********
     * Assignment 1
     * 	Create a trigger on the Account, to copy the billing address into the shipping address if shipping address is Blank.
     * 
     * Assignment 2: ***
     * 	Create a trigger on lead to check for duplicate lead on the basis of Email. 
     * 	Meaning, If a newly create lead contains email that allready exist in the system, 
     * 	then this lead will be marked as a duplicate lead, Duplicate = True;
     * */
}