 public with sharing class CTPersonTriggerHandler {
    public static void beforeInsert(List<Person__c> newRecords){
        for (Person__c Person : newRecords) {
            Person.Health_Status__c =  'Green';
            Person.Token__c = CTPersonController.getToken(person.Mobile__c);
        }
    }
    public static void beforeUpdate(List<Person__c> newRecords, Map <Id, Person__c> oldRecordsMaps){

        for(Person__c Person : newRecords){
            if(Person.Health_Status__c != oldRecordsMaps.get(person.Id).Health_Status__c){
                Person.Status_Update_Date__c = Date.today();
            }
        }
    }
    public static void afterUpdate(List<Person__c> newRecords, Map <Id, Person__c> oldRecordsMaps){
          Set<Id> statusChange = new Set<Id>();
          Set<Id> redStatus = new Set<Id>();

        for(Person__c Person : newRecords){
            if(Person.Health_Status__c != oldRecordsMaps.get(person.Id).Health_Status__c){
                statusChange.add(person.Id);
            
            }
            if(Person.Health_Status__c == 'Red' && oldRecordsMaps.get(person.Id).Health_Status__c != 'Red'){
               
                redStatus.add(person.Id);
            }
        }
       
        Set<Id> alreadyProcessed = new Set<Id>();
        alreadyProcessed.addAll(redStatus);

        Set<Id> orangeStatus = new Set<Id>();
        Set<Id> yellowStatus = new Set<Id>();
        Set<Id> primaryContacts =  new Set<Id>();
       
        List<Person__c> persontoUpdate = new List<Person__c>();
       
        // Let's add all cohabitants 
        orangeStatus.addAll(CTPersonController.getCohabitants(redStatus,alreadyProcessed));

        // Let's add all primary contacts
          primaryContacts = CTPersonController.getprimaryContacts(redStatus,alreadyProcessed);
         orangeStatus.addAll(primaryContacts);
  
            // Let's add all Neighbours 
        yellowStatus.addAll(CTPersonController.getNeighbours(redStatus,alreadyProcessed));
        // Let's add all primary contacts
        primaryContacts = CTPersonController.getprimaryContacts(redStatus,alreadyProcessed);
        orangeStatus.addAll(primaryContacts);

         // Let's add all primary contacts
         yellowStatus.addAll(CTPersonController.getsecondaryContacts(primaryContacts,alreadyProcessed));

         for (Id  pid : orangeStatus) {
             persontoUpdate.add(new Person__c(Id = pid, Health_Status__c= 'Orange'));
              
             }
             for (id pid : yellowStatus) {
                 persontoUpdate.add(new Person__c(Id = pid, Health_Status__c = 'Yellow'));
             }
             if (persontoUpdate.size()>0) {       
            
                update persontoUpdate;
             }
        
             List<Location_Tracing__c> locationTraces = CTLocationTracingController.getlocationByPersonID(statusChange);
        if (locationTraces != null  && locationTraces.size()>0){
            Set<Id> locationsids = new Set<Id>();
        for (Location_Tracing__c trace : locationTraces) {
            
            locationsids.add(trace.Location__c);        
        }
        CTLocationController.updateRedScore(locationsids);
        
    }
        
    }
 }



