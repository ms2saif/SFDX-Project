/*
Created By: Mohammad Saif Ansari 
*/
trigger ContactTrigger on Contact (after insert) {
	if(trigger.isInsert && trigger.isAfter){
        ContactTriggerHelper.afterInsertContact(Trigger.new);
    }
}
