trigger CTLocationTrigger on Location__c (before insert, after insert, before update, after update) {
    switch on Trigger.operationtype {
        when BEFORE_INSERT {
            CTLocationtriggerHandler.beforeInsert(Trigger.new);
            
        }
        when BEFORE_UPDATE {
            CTLocationtriggerHandler.beforeUpdate(trigger.new,trigger.oldMap);
            
        }
        when AFTER_UPDATE {
            CTLocationtriggerHandler.afterUpdate(trigger.new,trigger.oldMap);
            
        }
    }
   

}