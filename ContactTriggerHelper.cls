/*
Created By: Mohammad Saif Ansari
*/
public class ContactTriggerHelper {
    public static void afterInsertContact(List<Contact> listContact){
        if(!listContact.isEmpty()){
            List<Case> listCase = new List<Case>();
            List<Task> listTask = new List<Task>();
            for(Contact con : listContact){
                Case c = new Case();
                c.ContactId = con.Id;
                if(con.AccountId != null){
                    c.AccountId = con.AccountId;
                }
                c.Status = 'Working';
                c.Origin = 'New Contact';
                c.OwnerId = con.OwnerId;
                if(con.Level__c != null && con.Level__c == 'Primary'){
                    c.Priority = 'High';
                }else if(con.Level__c != null && con.Level__c == 'Secondary'){
                    c.Priority = 'Medium';
                }else if(con.Level__c != null && con.Level__c == 'Tertiary'){
                    c.Priority = 'Low';
                }
                listCase.add(c);
            }
            if(!listCase.isEmpty()){
                
                insert listCase;
                
                List<Case> lstCase = [Select Id, CaseNumber, OwnerId, Priority from Case where Id IN: listCase];
                for(Case cs : lstCase){
                    Task t = new Task();
                    t.WhatId = cs.Id;
                    t.Status = 'Not Started';
                    t.Subject = 'Welcome call for '+cs.CaseNumber;
                    t.Priority = 'Normal';
                    if(cs.Priority == 'High'){
                        t.ActivityDate = System.today().addDays(7);
                    }else if(cs.Priority == 'Medium'){
                        t.ActivityDate = System.today().addDays(14);
                    }else if(cs.Priority == 'Low'){
                        t.ActivityDate = System.today().addDays(21);
                    }
                    t.OwnerId = cs.OwnerId;
                    listTask.add(t);
                }
                if(!listTask.isEmpty()){
                    insert listTask;
                }
            }
        }
    }
}
