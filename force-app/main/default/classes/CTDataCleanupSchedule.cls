public with sharing class CTDataCleanupSchedule implements Schedulable {
    public static final String CRON = '0 0 2 * * ?';
public void execute(SchedulableContext sc){
    CTPeopleTracingDataCleanupBatch peopleTracingBatch = new CTPeopleTracingDataCleanupBatch();
    Database.executebatch(peopleTracingBatch, 2000);
        
}   

}
