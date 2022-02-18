public with sharing class CTLocationTracingTriggerHandler {
    public static void beforeInsert(List<Location_Tracing__c> newRecords) {
     List<Location_Tracing__c> duplicates = CTLocationtracingController.checkDuplicates(newRecords);
     for (Location_Tracing__c trace : duplicates) {
         trace.addError('Duplicate error found Location Id:'+trace.Location__c+'Person Id:' +trace.Person__c);
         
     }
    }
}
