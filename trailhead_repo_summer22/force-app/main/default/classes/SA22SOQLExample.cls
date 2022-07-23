public with sharing class SA22SOQLExample {
    
    
    public static void getContacts(){
        //Declaration
        List<Contact> contactList = new List<Contact>();

        //Logical
        //add Contact List from Salesforce into the List of Contact.
        contactList = [
            SELECT Id, Name, Email, Phone 
            FROM Contact
            ORDER BY Name
            LIMIT 10];
        //LOOP or Itteration 
        /*SYNTAX
            //FOR EACH LOOP.
            for(DATATYPE loopVariable : ListName){
                //DESIGN LOGIC USING loopVariable.
            }
        */

        For(Contact cont :contactList){
            System.debug('Name: ' + cont.Name);
            System.debug('Name: ' + cont.Email);
        }

        /*
            Indexing in LIST.
            in the list, indexing is start from ZERO.
        */
        //Display Second Index from List.
        System.debug('Second Contact: ' + contactList.get(1));
        System.debug('Second Contact Phone Only: ' + contactList.get(1).Phone);
        
        

        //output
        System.debug('contactList: ' + contactList);

    }


    @AuraEnabled(Cacheable = true)
    Public Static List<Contact> getContactList(){
         //Declaration
        List<Contact> contactList = new List<Contact>();

        //Logical
        //add Contact List from Salesforce into the List of Contact.
        contactList = [
            SELECT Id, Name, Email, Phone 
            FROM Contact
            ORDER BY Name
            LIMIT 10];

        //output
        System.debug('contactList: ' + contactList);
        return contactList;
    }


    //Non-primitive datatypes.
	//SET --> it is use only to store the unique values.

    //Declaration:
    //Set<Datatype> setName = new Set<Datatype>();//Datatype --> Primitive Datatype.

    //Requirement: To get the Unique email from the contact.
    public static void getUniqueEmails(){
        //Declaration
        List<Contact> contactList = new List<Contact>();
        Set<String> cotnactEmails = new Set<String>();

        //Logical
        //add Contact List from Salesforce into the List of Contact.
        contactList = [
            SELECT Id, Name, Email, Phone 
            FROM Contact
            WHERE Email != NULL
            ORDER BY Name
            LIMIT 10];

        For(Contact cont :contactList){
            cotnactEmails.add(cont.Email);
        }

        //output
        System.debug('cotnactEmails: ' + cotnactEmails);

        //Contains check.
        System.debug('Email Exists or NO?: ' + cotnactEmails.contains('bond_john@grandhotels.com'));
        System.debug('Email Exists or NO?: ' + cotnactEmails.contains('bond_john@test.com'));
    }
}