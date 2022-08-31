@isTest
public class ContactTriggerHelper_Test {
    @isTest
    public static void ContactTriggerHelperMethod(){
        Account acc = new Account();
        acc.Name = 'Savant Technology';
        insert acc;
        
        List<Contact> listCon = new List<Contact>();
        Contact con1 = new Contact();
        con1.AccountId = acc.Id;
        con1.LastName = 'Ansari';
        con1.Level__c = 'Primary';
        listCon.add(con1);
        
        Contact con2 = new Contact();
        con2.AccountId = acc.Id;
        con2.LastName = 'Ansari';
        con2.Level__c = 'Secondary';
        listCon.add(con2);
        
        Contact con3 = new Contact();
        con3.AccountId = acc.Id;
        con3.LastName = 'Ansari';
        con3.Level__c = 'Tertiary';
        listCon.add(con3);
        
        insert listCon;
    }
}