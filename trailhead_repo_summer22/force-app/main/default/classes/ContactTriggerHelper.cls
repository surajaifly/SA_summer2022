public class ContactTriggerHelper {
	
    public static void beforeInsert(List<Contact> newContactList){
        for(Contact cont :newContactList){
            if(cont.Birthdate != NULL){
                Integer ageOfContact = System.today().year() - cont.Birthdate.year();
                cont.Age__c = ageOfContact + ' Years';
            }
        }
    }
    
    public static void AfterInsert(List<Contact> newContactList){
        System.debug('IS AFTER INSERT UPDATE');
        Set<Id> accountIds = new Set<Id>();
        for(Contact newcont :newContactList){
            if(newcont.AccountId != NULL){
                    accountIds.add(newcont.AccountId);
                }
        }
        
        //Do a SOQL, to get all account s along with related contact.
        List<Account> accountList = new List<Account>();
        accountList = [SELECT Id,Name, 
                       	(SELECT Id FROM Contacts)
                      FROM Account 
                      WHERE Id IN :accountIds ];
        
        for(Account acc :accountList){
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }
        
        //UPDATE the account list with the new value of Number of Contacts.
        UPDATE accountList;
    }
    
    public static void beforeUpdate(List<Contact> newContactList, Map<id, Contact> oldContactMap){
        for(Contact cont :newContactList){
            if(cont.Birthdate != NULL){
                Integer ageOfContact = System.today().year() - cont.Birthdate.year();
                cont.Age__c = ageOfContact + ' Years';
            }
        }
    }
    
    public static void AfterUpdate(List<Contact> newContactList, Map<id, Contact> oldContactMap){
        System.debug('IS AFTER INSERT UPDATE');
        //Create a variable to store the Account Ids.
        Set<Id> accountIds = new Set<Id>();
        
        /*
        //Create a loop on trigger.old, to get account Ids.
        for(Contact oldCont :trigger.old){
            system.debug('OLD Value' + oldCont.MobilePhone);
        }
		*/
        
        //Create a loop on trigger.new, to get account Ids.
        for(Contact newcont :newContactList){
            //trigger.old, that contains the old instace of valus.
            //trigger.oldMap -> Map<id, Contact>.
            Contact oldContact = oldContactMap?.get(newcont.Id);//Precaution Part
            if(oldContact?.AccountId != newcont.AccountId){//Precaution Part
                if(newcont.AccountId != NULL){
                    accountIds.add(newcont.AccountId);
                }
            }
        }
        
        //Do a SOQL, to get all account s along with related contact.
        List<Account> accountList = new List<Account>();
        accountList = [SELECT Id,Name, 
                       	(SELECT Id FROM Contacts)
                      FROM Account 
                      WHERE Id IN :accountIds ];
        
        for(Account acc :accountList){
            //Caculating the related contacts size, to get the number of related contacts.
            //acc.contacts -> list<Contact>
            //list.Size() --> number of elements in the list.
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }
        
        //UPDATE the account list with the new value of Number of Contacts.
        UPDATE accountList;
    }
}