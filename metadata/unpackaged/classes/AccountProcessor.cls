public class AccountProcessor {
    
	@future
    public static void countContacts(Set<Id> setId){
        
        List<Account> accountList =  [Select id,Name, Number_of_Contacts__c, (select id from Contacts) from Account where id in : setId]; 
        For(Account acc: accountList){
            List<Contact> LstContact = acc.contacts;
            acc.Number_of_Contacts__c = LstContact.size();
        }
        update accountList;
    }
    
    
}