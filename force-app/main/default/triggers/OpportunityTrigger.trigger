/*
* Name: OpportunityTrigger
* Description: Runs before every Opportunity DML action
*/

trigger OpportunityTrigger on Opportunity (before insert, before update, before delete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            OpportunityTriggerHandler.beforeInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            OpportunityTriggerHandler.beforeUpdate(Trigger.newMap, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            //Develop before delete method
        }
    }
}