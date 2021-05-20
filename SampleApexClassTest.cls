@isTest
private class AA_SampleApexClassTest {
    @isTest static void testContactUpdate()
     {
       // Create Account Record
       Account accountRec = new Account();
       accountRec.Name = 'Test Account' ;
       insert accountRec ;

       // Create 20 Contact Records
       List<Contact> contactList = new List<Contact>();
       for (Integer i = 0; i < 20; i++) {
          Contact contactRec = new Contact();
          contactRec.LastName = 'Test Contact ' + i;
          contactRec.AccountId = accountRec.Id ; 
          contactList.add(contactRec);          
       }
       insert contactList ;

       AA_SampleApexClass.updateContacts(accountRec.Id);      
    }
}
