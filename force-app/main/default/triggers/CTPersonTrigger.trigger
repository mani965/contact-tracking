Trigger CTPersonTrigger on Person__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
        switch on Trigger.operationType {
            when BEFORE_INSERT {

                //TODO : UPDATE HEALTH STATUS
               // TO DO: GENERATE UNIQUE TOKEN
               CTPersonTriggerHandler.beforeInsert(Trigger.new);
               }

                
            
            when  BEFORE_UPDATE {
                CTPersonTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldmap);
                
            }
            when AFTER_UPDATE{
                CTPersonTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldmap);
            }
        }
         
        
    }