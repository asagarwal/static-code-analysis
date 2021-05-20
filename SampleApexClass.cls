public with sharing class AA_SampleApexClass {

    public static void updateContacts(Id accountId) {

        List<Account> accountList = [Select Id from Account Where Id = :accountId] ;
        for (Account accountRec : accountList){

            // SOQL Inside the Loop - Not a good idea
            List<Contact> contactList = [select id, salutation, firstname, lastname, email
            from Contact where accountId = :accountRec.Id];
            for(Contact contactRec: contactList) {

                contactRec.Description = contactRec.salutation + ' ' + contactRec.firstName + ' ' + contactRec.lastname;
                // DML Statement inside the loop. Another bad idea
                update contactRec;

            }      
          }
       }        
}
